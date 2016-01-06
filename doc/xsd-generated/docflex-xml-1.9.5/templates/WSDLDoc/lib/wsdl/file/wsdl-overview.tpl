<DOCFLEX_TEMPLATE VER='1.19'>
CREATED='2012-06-24 01:50:23'
LAST_UPDATE='2014-07-05 20:02:57'
DESIGNER_TOOL='DocFlex SDK 1.x'
DESIGNER_LICENSE_TYPE='Filigris Works Team'
APP_ID='docflex-xml-wsdldoc'
APP_NAME='DocFlex/XML WSDLDoc'
APP_VER='1.0.b'
APP_AUTHOR='Copyright © 2014 Filigris Works, Leonid Rudy Softwareprodukte. All rights reserved.'
FEATURE_TYPE='pro'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='wsdldoc'
ROOT_ET='wsdl:definitions'
TITLE_EXPR='title = getStringParam("$title");

(parentTitle = getStringParam("docTitle")) != null
  ? title + " | " + parentTitle : title'
HTML_HEAD_EXPR='title = getStringParam("$title");

(parentTitle = getStringParam("docTitle")) != null
  ? title = title + " | " + parentTitle;

\'<script type="text/javascript">
    window.onload = function() {
        parent.document.title="\' + encodeJScriptString (title) + \'";
    }
</script>\''
<TEMPLATE_PARAMS>
	PARAM={
		param.name='$mainXML';
		param.type='GOMElement';
		param.defaultValue.expr='findElementByKey ("main-xmls", getXMLDocument().id)';
	}
	PARAM={
		param.name='$nsURI';
		param.title='Namespace URI';
		param.type='string';
		param.defaultValue.expr='getAttrStringValue("targetNamespace")';
		param.fixed='true';
	}
	PARAM={
		param.name='$scope';
		param.description='Specifies the scope passed to subtemplates (called from this template):
<ul>
<li>"any" - unspecified</li>
<li>"namespace" - namespace overview</li>
<li>"wsdl_file" - WSDL file overview</li>
</ul>';
		param.type='enum';
		param.enum.values='any;namespace;wsdl_file';
		param.defaultValue='wsdl_file';
	}
	PARAM={
		param.name='$title';
		param.title='Schema doc\'s title';
		param.type='string';
		param.defaultValue.expr='\'WSDL File "\' + 
getXMLDocument().getAttrStringValue("xmlName") +
\'"\'';
		param.autoPassed='false';
	}
	PARAM={
		param.name='$page.heading.left';
		param.title='Page Heading (on the left)';
		param.type='string';
		param.defaultValue.expr='getStringParam("$title")';
		param.fixed='true';
	}
	PARAM={
		param.name='docTitle';
		param.title='Documentation Title';
		param.type='string';
	}
	PARAM={
		param.name='doc.wsdl.file';
		param.title='WSDL File Overview';
		param.title.style.bold='true';
		param.group='true';
	}
	PARAM={
		param.name='doc.wsdl.file.profile';
		param.title='WSDL File Profile';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.location';
		param.title='File Location';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.location.relative';
		param.title='Relative Path';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.location.hyperlink';
		param.title='Hyperlink';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.targetNamespace';
		param.title='Target Namespace';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.types.schemas';
		param.title='Types / Schemas';
		param.type='enum';
		param.enum.values='list;summary;none';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.defs';
		param.title='WSDL Definitions';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.profile.relatedWSDLs';
		param.title='Related WSDL Files';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.description';
		param.title='Description';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas';
		param.title='Embedded Schema Summary';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.annotation';
		param.title='Annotation';
		param.type='enum';
		param.enum.values='first_sentence;full;none';
		param.enum.displayValues='first sentence;full;none';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile';
		param.title='Schema Profile';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.location';
		param.title='Schema Location';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.location.relative';
		param.title='Relative Path';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.location.hyperlink';
		param.title='Hyperlink';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.targetNamespace';
		param.title='Target Namespace';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.version';
		param.title='Version';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.components';
		param.title='Components';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.formDefault';
		param.title='Default NS-Qualified Form';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.blockDefault';
		param.title='Default Block Attribute';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.blockDefault.value';
		param.title='Value';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.blockDefault.meaning';
		param.title='Meaning';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.finalDefault';
		param.title='Default Final Attribute';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.finalDefault.value';
		param.title='Value';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.finalDefault.meaning';
		param.title='Meaning';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.schemas.profile.relatedSchemas';
		param.title='Related Schemas';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs';
		param.title='WSDL Definition Summary';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.for';
		param.title='Generate For';
		param.title.style.italic='true';
		param.group='true';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.for.services';
		param.title='Services';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.for.bindings';
		param.title='Bindings';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.for.portTypes';
		param.title='Port Types';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.for.messages';
		param.title='Messages';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.sorting';
		param.title='Sorting';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.description';
		param.title='Description';
		param.type='enum';
		param.enum.values='first_sentence;full;none';
		param.enum.displayValues='first sentence;full;none';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile';
		param.title='Definition Profile';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile.namespace';
		param.title='Namespace';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile.portType';
		param.title='Port Type';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile.includes';
		param.title='Includes';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile.defined';
		param.title='Defined / XML Source';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.defs.profile.used';
		param.title='Used';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.xml';
		param.title='XML Source';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.xml.separate';
		param.title='Separate File';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.xml.box';
		param.title='Enclose in Box';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.xml.remove.wsdl.docs';
		param.title='Remove <wsdl:documentation>';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.wsdl.file.xml.remove.xsd.anns';
		param.title='Remove <xs:annotation>';
		param.type='boolean';
	}
	PARAM={
		param.name='show';
		param.title='Show';
		param.title.style.bold='true';
		param.group='true';
		param.group.defaultState='expanded';
	}
	PARAM={
		param.name='show.about';
		param.title='About (footer)';
		param.type='boolean';
	}
</TEMPLATE_PARAMS>
<STYLES>
	CHAR_STYLE={
		style.name='Code';
		style.id='cs1';
		text.font.name='Courier New';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs2';
		style.default='true';
	}
	PAR_STYLE={
		style.name='Detail Heading 1';
		style.id='s1';
		text.font.size='12';
		text.font.style.bold='true';
	}
	PAR_STYLE={
		style.name='Detail Heading 2';
		style.id='s2';
		text.font.size='10';
		text.font.style.bold='true';
		par.bkgr.opaque='true';
		par.bkgr.color='#EEEEFF';
		par.border.style='solid';
		par.border.color='#666666';
		par.margin.top='10';
		par.margin.bottom='8.3';
		par.padding.left='1.7';
		par.padding.right='1.7';
		par.padding.top='1.7';
		par.padding.bottom='1.7';
		par.page.keepWithNext='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs3';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Main Heading';
		style.id='s3';
		text.font.name='Verdana';
		text.font.size='13';
		text.font.style.bold='true';
		text.color.foreground='#4477AA';
		par.bkgr.opaque='true';
		par.bkgr.color='#EEEEEE';
		par.border.style='solid';
		par.border.color='#4477AA';
		par.margin.top='0';
		par.margin.bottom='7.5';
		par.padding.left='4.2';
		par.padding.right='4.2';
		par.padding.top='2.5';
		par.padding.bottom='2.5';
		par.page.keepTogether='true';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s4';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Normal Smaller';
		style.id='cs4';
		text.font.name='Arial';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Note Font';
		style.id='cs5';
		text.font.name='Arial';
		text.font.size='8';
		text.font.style.bold='false';
	}
	CHAR_STYLE={
		style.name='Page Header Font';
		style.id='cs6';
		text.font.name='Arial';
		text.font.style.italic='true';
	}
	CHAR_STYLE={
		style.name='Page Number';
		style.id='cs7';
		text.font.size='9';
		text.font.style.italic='true';
	}
	CHAR_STYLE={
		style.name='Summary Heading Font';
		style.id='cs8';
		text.font.size='12';
		text.font.style.bold='true';
	}
	CHAR_STYLE={
		style.name='XML Source';
		style.id='cs9';
		text.font.name='Verdana';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='XML Source Internal Subset';
		style.id='cs10';
		text.font.name='Courier New';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source Markup';
		style.id='cs11';
		text.color.foreground='#0000FF';
	}
</STYLES>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs3';
}
<HTARGET>
	HKEYS={
		'contextElement.id';
		'"detail"';
	}
</HTARGET>
<HTARGET>
	HKEYS={
		'getXMLDocument().id';
		'"detail"';
	}
</HTARGET>
<PAGE_HEADER>
	<AREA_SEC>
		FMT={
			text.style='cs6';
			table.cell.padding.both='0';
			table.border.style='none';
			table.border.bottom.style='solid';
		}
		<AREA>
			<CTRL_GROUP>
				FMT={
					par.border.bottom.style='solid';
				}
				<CTRLS>
					<DATA_CTRL>
						FORMULA='getStringParam("$page.heading.left")'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
</PAGE_HEADER>
<ROOT>
	<AREA_SEC>
		FMT={
			par.style='s3';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						FORMULA='getParam("$title")'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<TEMPLATE_CALL>
		COND='getBooleanParam("doc.wsdl.file.profile")'
		TEMPLATE_FILE='wsdlProfile.tpl'
		PASSED_PARAMS={
			'$wsdlOverview','true';
			'doc.wsdl.file.profile.types.schemas','"list"';
		}
		FMT={
			sec.spacing.before='10';
		}
	</TEMPLATE_CALL>
	<FOLDER>
		DESCR='Description'
		COND='getBooleanParam("doc.wsdl.file.description")'
		COLLAPSED
		<BODY>
			<SS_CALL>
				SS_NAME='Description'
			</SS_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s2';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							trow.bkgr.color='#CCCCFF';
						}
						<CTRLS>
							<TEXT_CTRL>
								TEXT='Description'
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<TEMPLATE_CALL>
		DESCR='embedded schema summary'
		COND='getBooleanParam("doc.wsdl.file.schemas")'
		TEMPLATE_FILE='../../xsd/schema/schemaSummary.tpl'
		PASSED_PARAMS={
			'doc.frgm.xsd.schemas.annotation','getStringParam("doc.wsdl.file.schemas.annotation")';
			'doc.frgm.xsd.schemas.profile','getBooleanParam("doc.wsdl.file.schemas.profile")';
			'doc.frgm.xsd.schemas.profile.location','getBooleanParam("doc.wsdl.file.schemas.profile.location")';
			'doc.frgm.xsd.schemas.profile.location.relative','getBooleanParam("doc.wsdl.file.schemas.profile.location.relative")';
			'doc.frgm.xsd.schemas.profile.location.hyperlink','getBooleanParam("doc.wsdl.file.schemas.profile.location.hyperlink")';
			'doc.frgm.xsd.schemas.profile.targetNamespace','getBooleanParam("doc.wsdl.file.schemas.profile.targetNamespace")';
			'doc.frgm.xsd.schemas.profile.version','getBooleanParam("doc.wsdl.file.schemas.profile.version")';
			'doc.frgm.xsd.schemas.profile.components','getBooleanParam("doc.wsdl.file.schemas.profile.components")';
			'doc.frgm.xsd.schemas.profile.formDefault','getBooleanParam("doc.wsdl.file.schemas.profile.formDefault")';
			'doc.frgm.xsd.schemas.profile.blockDefault','getBooleanParam("doc.wsdl.file.schemas.profile.blockDefault")';
			'doc.frgm.xsd.schemas.profile.blockDefault.value','getBooleanParam("doc.wsdl.file.schemas.profile.blockDefault.value")';
			'doc.frgm.xsd.schemas.profile.blockDefault.meaning','getBooleanParam("doc.wsdl.file.schemas.profile.blockDefault.meaning")';
			'doc.frgm.xsd.schemas.profile.finalDefault','getBooleanParam("doc.wsdl.file.schemas.profile.finalDefault")';
			'doc.frgm.xsd.schemas.profile.finalDefault.value','getBooleanParam("doc.wsdl.file.schemas.profile.finalDefault.value")';
			'doc.frgm.xsd.schemas.profile.finalDefault.meaning','getBooleanParam("doc.wsdl.file.schemas.profile.finalDefault.meaning")';
			'doc.frgm.xsd.schemas.profile.relatedSchemas','getBooleanParam("doc.wsdl.file.schemas.profile.relatedSchemas")';
		}
		FMT={
			sec.spacing.before='10';
		}
		<HTARGET>
			HKEYS={
				'contextElement.id';
				'"schema-summary"';
			}
		</HTARGET>
	</TEMPLATE_CALL>
	<FOLDER>
		DESCR='WSDL DEFINITION SUMMARIES'
		COND='getBooleanParam("doc.wsdl.file.defs")'
		FMT={
			sec.spacing.before='11.7';
		}
		<BODY>
			<TEMPLATE_CALL>
				DESCR='services'
				COND='getBooleanParam("doc.wsdl.file.defs.for.services")'
				TEMPLATE_FILE='../service/serviceSummary.tpl'
				PASSED_PARAMS={
					'doc.frgm.wsdl.defs.sorting','getBooleanParam("doc.wsdl.file.defs.sorting")';
					'doc.frgm.wsdl.defs.description','getStringParam("doc.wsdl.file.defs.description")';
					'doc.frgm.wsdl.defs.profile','getBooleanParam("doc.wsdl.file.defs.profile")';
					'doc.frgm.wsdl.defs.profile.namespace','getBooleanParam("doc.wsdl.file.defs.profile.namespace")';
					'doc.frgm.wsdl.defs.profile.portType','getBooleanParam("doc.wsdl.file.defs.profile.portType")';
					'doc.frgm.wsdl.defs.profile.includes','getBooleanParam("doc.wsdl.file.defs.profile.includes")';
					'doc.frgm.wsdl.defs.profile.defined','getBooleanParam("doc.wsdl.file.defs.profile.defined")';
					'doc.frgm.wsdl.defs.profile.used','getBooleanParam("doc.wsdl.file.defs.profile.used")';
				}
				FMT={
					sec.spacing.before='10';
				}
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"service-summary"';
					}
				</HTARGET>
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='bindings'
				COND='getBooleanParam("doc.wsdl.file.defs.for.bindings")'
				TEMPLATE_FILE='../binding/bindingSummary.tpl'
				PASSED_PARAMS={
					'doc.frgm.wsdl.defs.sorting','getBooleanParam("doc.wsdl.file.defs.sorting")';
					'doc.frgm.wsdl.defs.description','getStringParam("doc.wsdl.file.defs.description")';
					'doc.frgm.wsdl.defs.profile','getBooleanParam("doc.wsdl.file.defs.profile")';
					'doc.frgm.wsdl.defs.profile.namespace','getBooleanParam("doc.wsdl.file.defs.profile.namespace")';
					'doc.frgm.wsdl.defs.profile.portType','getBooleanParam("doc.wsdl.file.defs.profile.portType")';
					'doc.frgm.wsdl.defs.profile.includes','getBooleanParam("doc.wsdl.file.defs.profile.includes")';
					'doc.frgm.wsdl.defs.profile.defined','getBooleanParam("doc.wsdl.file.defs.profile.defined")';
					'doc.frgm.wsdl.defs.profile.used','getBooleanParam("doc.wsdl.file.defs.profile.used")';
				}
				FMT={
					sec.spacing.before='10';
				}
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"binding-summary"';
					}
				</HTARGET>
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='port types'
				COND='getBooleanParam("doc.wsdl.file.defs.for.portTypes")'
				TEMPLATE_FILE='../portType/portTypeSummary.tpl'
				PASSED_PARAMS={
					'doc.frgm.wsdl.defs.sorting','getBooleanParam("doc.wsdl.file.defs.sorting")';
					'doc.frgm.wsdl.defs.description','getStringParam("doc.wsdl.file.defs.description")';
					'doc.frgm.wsdl.defs.profile','getBooleanParam("doc.wsdl.file.defs.profile")';
					'doc.frgm.wsdl.defs.profile.namespace','getBooleanParam("doc.wsdl.file.defs.profile.namespace")';
					'doc.frgm.wsdl.defs.profile.portType','getBooleanParam("doc.wsdl.file.defs.profile.portType")';
					'doc.frgm.wsdl.defs.profile.includes','getBooleanParam("doc.wsdl.file.defs.profile.includes")';
					'doc.frgm.wsdl.defs.profile.defined','getBooleanParam("doc.wsdl.file.defs.profile.defined")';
					'doc.frgm.wsdl.defs.profile.used','getBooleanParam("doc.wsdl.file.defs.profile.used")';
				}
				FMT={
					sec.spacing.before='10';
				}
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"portType-summary"';
					}
				</HTARGET>
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='messages'
				COND='getBooleanParam("doc.wsdl.file.defs.for.messages")'
				TEMPLATE_FILE='../message/messageSummary.tpl'
				PASSED_PARAMS={
					'doc.frgm.wsdl.defs.sorting','getBooleanParam("doc.wsdl.file.defs.sorting")';
					'doc.frgm.wsdl.defs.description','getStringParam("doc.wsdl.file.defs.description")';
					'doc.frgm.wsdl.defs.profile','getBooleanParam("doc.wsdl.file.defs.profile")';
					'doc.frgm.wsdl.defs.profile.namespace','getBooleanParam("doc.wsdl.file.defs.profile.namespace")';
					'doc.frgm.wsdl.defs.profile.portType','getBooleanParam("doc.wsdl.file.defs.profile.portType")';
					'doc.frgm.wsdl.defs.profile.includes','getBooleanParam("doc.wsdl.file.defs.profile.includes")';
					'doc.frgm.wsdl.defs.profile.defined','getBooleanParam("doc.wsdl.file.defs.profile.defined")';
					'doc.frgm.wsdl.defs.profile.used','getBooleanParam("doc.wsdl.file.defs.profile.used")';
				}
				FMT={
					sec.spacing.before='10';
				}
				<HTARGET>
					HKEYS={
						'contextElement.id';
						'"message-summary"';
					}
				</HTARGET>
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<FOLDER>
		DESCR='XML SOURCE'
		COND='getBooleanParam("doc.wsdl.file.xml") &&
! getBooleanParam("doc.wsdl.file.xml.separate")'
		CONTEXT_ELEMENT_EXPR='getXMLDocument()'
		MATCHING_ET='#DOCUMENT'
		COLLAPSED
		FMT={
			sec.spacing.before='11.7';
		}
		<HTARGET>
			HKEYS={
				'Array (contextElement.id, getXMLDocument().id)';
				'"xml-source"';
			}
			NAME_EXPR='output.type == "document" ? "xml_source" : ""'
		</HTARGET>
		<BODY>
			<AREA_SEC>
				COND='getBooleanParam("doc.wsdl.file.xml.box")'
				BREAK_PARENT_BLOCK='when-executed'
				FMT={
					sec.outputStyle='table';
					table.sizing='Relative';
					table.autofit='false';
					table.cell.padding.both='3.3';
					table.bkgr.color='#F5F5F5';
					table.border.style='solid';
					table.border.color='#999999';
					table.option.borderStylesInHTML='true';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<TEMPLATE_CALL_CTRL>
								TEMPLATE_FILE='../../xml/documentSource.tpl'
								PASSED_PARAMS={
									'$bookmark.elements','true';
									'$bookmark.xmlns','true';
									'$remove.wsdl.docs','getBooleanParam("doc.wsdl.file.xml.remove.wsdl.docs")';
									'$remove.xsd.anns','getBooleanParam("doc.wsdl.file.xml.remove.xsd.anns")';
								}
								FMT={
									ctrl.size.width='499.5';
									ctrl.size.height='17.3';
								}
							</TEMPLATE_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../../xml/documentSource.tpl'
				PASSED_PARAMS={
					'$bookmark.elements','true';
					'$bookmark.xmlns','true';
					'$remove.wsdl.docs','getBooleanParam("doc.wsdl.file.xml.remove.wsdl.docs")';
					'$remove.xsd.anns','getBooleanParam("doc.wsdl.file.xml.remove.xsd.anns")';
				}
			</TEMPLATE_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					sec.outputStyle='table';
					table.sizing='Relative';
				}
				<AREA>
					<SPACER>
						FMT={
							spacer.height='10';
						}
					</SPACER>
					<CTRL_GROUP>
						<CTRLS>
							<PANEL>
								FMT={
									ctrl.size.width='499.5';
									ctrl.size.height='41.3';
									tcell.bkgr.color='#CCCCFF';
									par.style='s1';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<TEXT_CTRL>
												TEXT='XML Source'
											</TEXT_CTRL>
											<DELIMITER>
												FMT={
													text.style='cs1';
												}
											</DELIMITER>
											<TEMPLATE_CALL_CTRL>
												TEMPLATE_FILE='../../xml/sourceNote.tpl'
												PASSED_PARAMS={
													'$remove.wsdl.docs','getBooleanParam("doc.wsdl.file.xml.remove.wsdl.docs")';
													'$remove.xsd.anns','getBooleanParam("doc.wsdl.file.xml.remove.xsd.anns")';
												}
												FMT={
													text.style='cs5';
												}
											</TEMPLATE_CALL_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
						</CTRLS>
					</CTRL_GROUP>
					<SPACER>
						FMT={
							spacer.height='8.3';
						}
					</SPACER>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<TEMPLATE_CALL>
		DESCR='Bottom Message'
		COND='output.type == "document" && getBooleanParam("show.about")'
		TEMPLATE_FILE='../../about.tpl'
	</TEMPLATE_CALL>
</ROOT>
<STOCK_SECTIONS>
	<TEMPLATE_CALL>
		SS_NAME='Description'
		MATCHING_ET='wsdl:%tDocumented'
		TEMPLATE_FILE='../../doc/docOutput.tpl'
		PASSED_ROOT_ELEMENT_EXPR='findChild("wsdl:documentation")'
	</TEMPLATE_CALL>
</STOCK_SECTIONS>
CHECKSUM='vGpGpJFip8KFBRsBNLLSeEWSH?3lodVJuPie+gbcVWo'
</DOCFLEX_TEMPLATE>