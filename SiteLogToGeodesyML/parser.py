"""
This module contains the parsing and logging functions
"""

import sys
import re
import pyxb.bundles.opengis.gml_3_2 as gml
import SiteLogToGeodesyML.sitelogtogeodesyml_bindings as geo
import logging
import logging.config

from pyxb import BIND
import pyxb.utils.domutils as domutils
import pyxb.binding.datatypes as xsd
import pyxb.bundles.opengis.gml_3_2 as gml
import pyxb.bundles.opengis.iso19139.v20070417.gmd as gmd
import pyxb.binding.datatypes
import pyxb.bundles.opengis.om_2_0 as om
import pyxb.bundles.opengis.iso19139.v20070417.gco as gco
import pyxb.bundles.common.xlink as xlink
import pyxb.bundles.opengis as opengis

logger = logging.getLogger('sitelogtogeodesyml')
    
def errorMessage(line, content, comment):
    sys.stderr.write("{\n")
    sys.stderr.write("    Line no: %s\n" % line)
    sys.stderr.write("    Content: %s\n" % content)
    sys.stderr.write("   #comment: %s\n" % comment)
    sys.stderr.write("}\n")


def infoMessage(line, content, comment):
    sys.stderr.write("{\n")
    sys.stderr.write("    Line no: %s\n" % line)
    sys.stderr.write("    Content: %s\n" % content.encode('UTF-8'))
    sys.stderr.write("   #comment: %s\n" % comment)
    sys.stderr.write("}\n")


def processingNotes(text):
    pattern = re.compile(r'^\(multiple lines\)$', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        return ""
    else:
        return text    
    

def normaliseString(string):
    str = string.strip()
    return '' if re.match(r'^\(.*\)$', str) else str


def parseCodeTypeAndVersion(target, field, pattern, text, line, space, versionRef):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        versionRef[0] = int(ok.group('version').strip())
        code = gml.CodeType(value, codeSpace=space)
        setattr(target, field, code)
        return True
    else:
        return False
        
        
def parseText(variable, pattern, text, line):
    ok = re.match(pattern, text)
    if ok:
        variable.append(normaliseString(ok.group('value')))
        return True
    else:
        return False
    
def setTextAttribute(target, field, pattern, text, line, mandatory=False):
    ok = re.match(pattern, text)
    if ok:
        setattr(target, field, normaliseString(ok.group('value')))
        return True
    else:
        if mandatory:
            setattr(target, field, "")    
        return False
  

def setDoubleAttribute(target, field, pattern, text, line, mandatory=False, withDefault=False, output=True):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            ok = re.match(floatPattern, value)
            if ok:
                floatValue = ok.group('float').strip()
                setattr(target, field, float(floatValue))
            else:
                logger.info("line %s: invalid value as %s", line, value)
                if mandatory:
                    setattr(target, field, 0.0)
        else:
            if output:
                logger.info("line %s: missing value", line)
            if mandatory:
                if withDefault:
                    setattr(target, field, 0.0)
                else:
                    setattr(target, field, None)
        return True
    else:
        return False

def setNillableDoubleAttribute(target, field, pattern, text, line, mandatory=True, output=True):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    nonePattern = re.compile(r'none', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            bracketedFloatPattern = re.compile(r'\(.*(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?).*\)', re.IGNORECASE)
            # for a very special case as:            Marker->ARP East Ecc(m)  : (F8.4)
            # you should NOT extract '8.4' as the double value
            special = re.match(bracketedFloatPattern, value)
            if special:
                ok = False
            else:
                ok = re.search(floatPattern, value)

            if ok:
                floatValue = ok.group('float')
                if len(floatValue) < len(value):
                    if output:
                        message = "Only the double decimal '" + str(float(floatValue)) + "' have been extracted, else discarded"
                        infoMessage(line, text, message)
                nilDouble = geo.NillableDouble(float(floatValue))
                setattr(target, field, nilDouble)
            else:
                if mandatory:
                    nilDouble = geo.NillableDouble()
                    nilDouble._setIsNil()
                    setattr(target, field, nilDouble)
                    if output:
                        errorMessage(line, value, "A double decimal is expected")
                else:
                    ok = re.match(nonePattern, value)
                    if not ok:
                        if output:
                            errorMessage(line, value, "A double decimal is expected")
        else:
            if mandatory:
                nilDouble = geo.NillableDouble()
                nilDouble._setIsNil()
                setattr(target, field, nilDouble)
                if output:
                    errorMessage(line, "", "A double decimal is expected")
        return True
    else:
        return False

def setDateTimeAttribute(target, field, pattern, text, line, mandatory=True):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        try:
            setattr(target, field, timePosition(value))
        except ValueError as e:
            if mandatory:
                errorMessage(line, value, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
            else:
                digit = re.compile(r'\d+')
                if re.match(digit, value):
                    errorMessage(line, value, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
            setattr(target, field, gml.TimePositionType())              
        except:
            pass
        return True
    else:
        return False
    
def parseNillableDouble(variable, pattern, text, line, mandatory=True, output=True):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    nonePattern = re.compile(r'none', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            bracketedFloatPattern = re.compile(r'\(.*(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?).*\)', re.IGNORECASE)
            # for a very special case as:            Marker->ARP East Ecc(m)  : (F8.4)
            # you should NOT extract '8.4' as the double value
            special = re.search(bracketedFloatPattern, value)
            if special:
                ok = False
            else:
                ok = re.search(floatPattern, value)

            if ok:
                floatValue = ok.group('float')
                if len(floatValue) < len(value):
                    if output:
                        message = "Only the double decimal '" + str(float(floatValue)) + "' have been extracted, else discarded"
                        infoMessage(line, text, message)
                nilDouble = geo.NillableDouble(float(floatValue))
                variable.append(nilDouble)
            else:
                if mandatory:
                    nilDouble = geo.NillableDouble()
                    nilDouble._setIsNil()
                    variable.append(nilDouble)
                    if output:
                        errorMessage(line, value, "A double decimal is expected")
                else:
                    ok = re.match(nonePattern, value)
                    if not ok:
                        if output:
                            errorMessage(line, value, "A double decimal is expected")
        else:
            if mandatory:
                nilDouble = geo.NillableDouble()
                nilDouble._setIsNil()
                variable.append(nilDouble)
                if output:
                    errorMessage(line, "", "A double decimal is expected")
        return True
    else:
        return False


def parseDouble(variable, pattern, text, line, mandatory=False, output=True):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            ok = re.match(floatPattern, value)
            if ok:
                floatValue = ok.group('float').strip()
                variable.append(float(floatValue))
            else:
                logger.info("line %s: invalid value as %s", line, value)
                if mandatory:
                    variable.append(0.0)
        else:
            if output:
                logger.info("line %s: missing value", line)
            if mandatory:
                variable.append(0.0)
        return True
    else:
        return False


def parseInt(variable, pattern, text, line, mandatory=False):
    intPattern = re.compile(r'(?P<number>[+-]?(?<!\.)\b[0-9]+\b(?!\.[0-9]))', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            ok = re.match(intPattern, value)
            if ok:
                number = ok.group('number').strip()
                variable.append(int(number))
            else:
                logger.info("line %s: invalid number as %s", line, value)
                if mandatory:
                    variable.append(0)
        else:
            logger.info("line %s: missing number", line)
            if mandatory:
                variable.append(0)
        return True
    else:
        return False


def parseCodeType(target, field, pattern, text, line, space):
    ok = re.match(pattern, text)
    if ok:
        value = normaliseString(ok.group('value'))
        code = gml.CodeType(value, codeSpace=space)
        setattr(target, field, code)
        return True
    else:
        return False

    
def parseRadomeModelCodeType(variable, pattern, text, line,
        space="urn:igs-org:gnss-radome-model-code"):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        code = geo.igsRadomeModelCodeType(value, codeSpace=space)
        setattr(variable, "antennaRadomeType", code)
        return True
    else:
        return False
    
def parseAntennaModelCodeType(variable, pattern, text, line, versionRef,
        space="urn:xml-gov-au:icsm:egeodesy:0.4",
        theCodeList="http://xml.gov.au/icsm/geodesyml/codelists/antenna-receiver-codelists.xml#GeodesyML_GNSSAntennaTypeCode"):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        versionRef[0] = int(ok.group('version').strip())
        code = geo.igsAntennaModelCodeType(value, codeSpace=space, codeList=theCodeList, codeListValue=value)
        setattr(variable, "igsModelCode", code)
        return True
    else:
        return False


def parseReceiverModelCodeType(variable, pattern, text, line, versionRef,
        space="urn:xml-gov-au:icsm:egeodesy:0.4",
        theCodeList="http://xml.gov.au/icsm/geodesyml/codelists/antenna-receiver-codelists.xml#GeodesyML_GNSSReceiverTypeCode"):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        versionRef[0] = int(ok.group('version').strip())
        code = geo.igsReceiverModelCodeType(value, codeSpace=space, codeList=theCodeList, codeListValue=value)
        setattr(variable, "igsModelCode", code)
        return True
    else:
        return False


def parseDateTime(variable, pattern, text, line, mandatory=True):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        try:
            variable.append(timePosition(value))
        except ValueError as e:
            if mandatory:
                errorMessage(line, value, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
            else:
                digit = re.compile(r'\d+')
                if re.match(digit, value):
                    errorMessage(line, value, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
            variable.append(gml.TimePositionType())
            
        except:
            pass
        return True
    else:
        return False


def textToDateTime(text, line, mandatory = False):
    pattern = re.compile(r'[\(]?CCYY-MM-DD[\)]?', re.IGNORECASE)
    matched = re.match(pattern, text)
    if matched:
        if mandatory:
            errorMessage(line, text, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
        return gml.TimePositionType()
    else:
        try:
            dateTime = timePosition(text)
        except ValueError as e:
            errorMessage(line, text, "A date time in format 'YYYY-MM-DD' or 'YYYY-MM-DDThh:mmZ' is expected")
            dateTime = gml.TimePositionType()
        except:
            dateTime = gml.TimePositionType()

        return dateTime


def setTimePeriodAttribute(target, field, pattern, text, line, siteLog, mandatory = True):
    ok = re.match(pattern, text)
    if ok:
        beginText = ""
        endText = ""
        if ok.group('begin'):
            beginText = ok.group('begin').strip()
        if ok.group('end'):
            endText = ok.group('end').strip()
        if ok.group('start'):
            beginText = ok.group('start').strip()

        begin = textToDateTime(beginText, line, True)
        end = textToDateTime(endText, line, mandatory)

        try:
            validTime = gml.TimePrimitivePropertyType()
            siteLog.TimePeriodIndex += 1
            timePeriod = gml.TimePeriod(id=target.id + "--time-period-" + str(siteLog.TimePeriodIndex))
            timePeriod.append(begin)
            timePeriod.append(end)
            validTime.append(timePeriod)
            setattr(target, field, validTime)
        except pyxb.PyXBException as e:
            errorMessage(line, beginText + "/" + endText, "A time period in format 'YYYY-MM-DD/YYYY-MM-DD' is expected")
            validTime = gml.TimePrimitivePropertyType(nilReason="inapplicable")
            setattr(target, field, validTime)
        except:
            pass

        return True
    else:
        return False

def parseTimePeriod(variable, pattern, text, line, siteLog, mandatory = True):
    ok = re.match(pattern, text)
    if ok:
        beginText = ""
        endText = ""
        if ok.group('begin'):
            beginText = ok.group('begin').strip()
        if ok.group('end'):
            endText = ok.group('end').strip()
        if ok.group('start'):
            beginText = ok.group('start').strip()

        begin = textToDateTime(beginText, line, True)
        end = textToDateTime(endText, line, mandatory)

        try:
            validTime = gml.TimePrimitivePropertyType()
            siteLog.TimePeriodIndex += 1
            timePeriod = gml.TimePeriod(id="time-period-" + str(siteLog.TimePeriodIndex))
            timePeriod.append(begin)
            timePeriod.append(end)
            validTime.append(timePeriod)
            variable.append(validTime)
        except pyxb.PyXBException as e:
            errorMessage(line, beginText + "/" + endText, "A time period in format 'YYYY-MM-DD/YYYY-MM-DD' is expected")
            validTime = gml.TimePrimitivePropertyType(nilReason="inapplicable")
            variable.append(validTime)
        except:
            pass

        return True
    else:
        return False
        
def dateTimeWithoutSeconds(str):
    pattern = re.compile(r'^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})Z$', re.IGNORECASE)
    matched = re.match(pattern, str)
    if matched:
        year = int(matched.group(1))
        month = int(matched.group(2))
        date = int(matched.group(3))
        hour = int(matched.group(4))
        minute = int(matched.group(5))
        xsd.dateTime(year, month, date, hour, minute)
        return '{:d}-{:02d}-{:02d}T{:02d}:{:02d}:00Z'.format(year, month, date, hour, minute)
        
    raise ValueError('Invalid date time without seconds: {}'.format(str))

def timePosition(str):
    year = re.match(r'^(\d{4})-MM-DD', str)
    if year:
        str = year.group(1)
    else:
        yearMonth = re.match(r'^(\d{4}-\d{2})-DD', str)
        if yearMonth:
            str = yearMonth.group(1)

    dateTypes = [xsd.dateTime, dateTimeWithoutSeconds, xsd.date, xsd.gYearMonth, xsd.gYear]
    for dateType in dateTypes:
        try:
            return gml.TimePositionType(dateType(str))
        except (xsd.SimpleTypeValueError, ValueError):
            pass

    raise ValueError('Invalid date {}'.format(str))

def assignNotes(variable, pattern, text, line):
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            if variable[0]:
                variable[0] += "\n"
            variable[0] += value
        return True
    else:
        return False
        
def assignText(variable, pattern, text, line):
    ok = re.match(pattern, text)
    if ok:
        value = normaliseString(ok.group('value'))
        variable[0] = value
        return True
    else:
        return False

def assignNillableDouble(variable, pattern, text, line, mandatory=False):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            ok = re.search(floatPattern, value)
            if ok:
                floatValue = ok.group('float')
                if len(floatValue) < len(value):
                    message = "Only the double decimal '" + floatValue + "' have been extracted, else discarded"
                    infoMessage(line, text, message)
                variable[0] = geo.NillableDouble(float(floatValue))
            else:
                errorMessage(line, value, "A double decimal is expected")
                variable[0] = geo.NillableDouble()
                variable[0]._setIsNil()
        else:
            variable[0] = geo.NillableDouble()
            variable[0]._setIsNil()
            errorMessage(line, "", "A double decimal is expected")
        return True
    else:
        return False


def assignDouble(variable, pattern, text, line):
    floatPattern = re.compile(r'(?P<float>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)', re.IGNORECASE)
    ok = re.match(pattern, text)
    if ok:
        value = ok.group('value').strip()
        if value:
            ok = re.match(floatPattern, value)
            if ok:
                floatValue = ok.group('float').strip()
                variable[0] = float(floatValue)
            else:
                logger.info("line %s: invalid value as %s", line, value)
                variable[0] = None
        else:
            logger.info("line %s: missing value", line)
            variable[0] = None
        return True
    else:
        return False
