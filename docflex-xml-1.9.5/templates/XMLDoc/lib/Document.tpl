<DOCFLEX_TEMPLATE VER='1.19'>
CREATED='2005-01-18 01:00:00'
LAST_UPDATE='2013-12-16 01:47:49'
DESIGNER_TOOL='DocFlex SDK 1.x'
DESIGNER_LICENSE_TYPE='Filigris Works Team'
APP_NAME='XMLDoc'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xmldoc'
ROOT_ET='#DOCUMENT'
DESCR='Processes a single XML file'
TITLE_EXPR='title = getAttrStringValue("xmlName");

(parentTitle = getStringParam("docTitle")) != null
  ? title + " (" + parentTitle + ")" : title'
HTML_HEAD_EXPR='title = getAttrStringValue("xmlName");

(parentTitle = getStringParam("docTitle")) != null
  ? title = title + " (" + parentTitle + ")";

\'<script type="text/javascript">
    window.onload = function() {
        parent.document.title="\' + encodeJScriptString (title) + \'";
    }
</script>\''
<TEMPLATE_PARAMS>
	PARAM={
		param.name='docTitle';
		param.title='Documentation Title';
		param.description='Specify the title for the documentation.';
		param.type='string';
	}
</TEMPLATE_PARAMS>
<STYLES>
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs1';
		style.default='true';
	}
	PAR_STYLE={
		style.name='File Info';
		style.id='s1';
		text.font.size='7';
		text.font.style.bold='true';
		par.margin.top='1.7';
	}
	PAR_STYLE={
		style.name='Heading 1';
		style.id='s2';
		text.font.name='Arial';
		text.font.size='16';
		text.font.style.bold='true';
		par.level='1';
		par.border.bottom.style='solid';
		par.border.bottom.thickness='medium';
		par.padding.bottom='1.7';
		par.page.keepWithNext='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs2';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='Hyperlink (blended in)';
		style.id='cs3';
		text.decor.underline='true';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s3';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Page header / footer';
		style.id='cs4';
		text.font.name='Arial';
		text.font.style.italic='true';
	}
	CHAR_STYLE={
		style.name='XML Source';
		style.id='cs5';
		text.font.name='Verdana';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='XML Source Attribute Name';
		style.id='cs6';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#990000';
	}
	CHAR_STYLE={
		style.name='XML Source Attribute Name (Reserved)';
		style.id='cs7';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#FF0000';
	}
	CHAR_STYLE={
		style.name='XML Source Attribute Value';
		style.id='cs8';
		text.font.name='Verdana';
		text.font.size='7';
		text.font.style.bold='true';
		text.color.foreground='#000000';
	}
	CHAR_STYLE={
		style.name='XML Source Attribute Value (Reserved)';
		style.id='cs9';
		text.font.name='Verdana';
		text.font.size='7';
		text.font.style.bold='true';
		text.color.foreground='#FF0000';
	}
	CHAR_STYLE={
		style.name='XML Source Attribute Value Markup';
		style.id='cs10';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source CDATA';
		style.id='cs11';
		text.font.name='Verdana';
		text.font.size='7';
		text.font.style.bold='true';
		text.color.foreground='#000000';
	}
	CHAR_STYLE={
		style.name='XML Source CDATA Markup';
		style.id='cs12';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source Comment';
		style.id='cs13';
		text.font.name='Courier New';
		text.font.size='8';
		text.color.foreground='#4D4D4D';
	}
	CHAR_STYLE={
		style.name='XML Source Comment Markup';
		style.id='cs14';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source DOCTYPE';
		style.id='cs15';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source Element Name';
		style.id='cs16';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#990000';
	}
	CHAR_STYLE={
		style.name='XML Source Element Value';
		style.id='cs17';
		text.font.name='Verdana';
		text.font.size='7';
		text.font.style.bold='true';
		text.color.foreground='#000000';
	}
	CHAR_STYLE={
		style.name='XML Source Internal Subset';
		style.id='cs18';
		text.font.name='Courier New';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source Markup';
		style.id='cs19';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
	CHAR_STYLE={
		style.name='XML Source Processing Instruction';
		style.id='cs20';
		text.font.name='Verdana';
		text.font.size='8';
		text.color.foreground='#0000FF';
	}
</STYLES>
FMT={
	doc.lengthUnits='pt';
	doc.default.font='Arial';
}
<HTARGET>
	HKEYS={
		'contextElement.id';
		'"detail"';
	}
</HTARGET>
<PAGE_FOOTER>
	<AREA_SEC>
		FMT={
			sec.outputStyle='table';
			text.style='cs4';
			table.sizing='Relative';
			table.cell.padding.horz='0.8';
			table.border.style='none';
			table.border.top.style='solid';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						ATTR='xmlName'
						FMT={
							ctrl.size.width='303';
							ctrl.size.height='39.8';
						}
					</DATA_CTRL>
					<PANEL>
						FMT={
							content.outputStyle='text-par';
							ctrl.size.width='196.5';
							ctrl.size.height='39.8';
							tcell.align.horz='Right';
							table.border.style='none';
						}
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<TEXT_CTRL>
										TEXT='Page'
									</TEXT_CTRL>
									<DATA_CTRL>
										DOCFIELD='page'
									</DATA_CTRL>
									<TEXT_CTRL>
										TEXT='of'
									</TEXT_CTRL>
									<DATA_CTRL>
										DOCFIELD='num-pages'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</PANEL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
</PAGE_FOOTER>
<ROOT>
	<AREA_SEC>
		DESCR='XML\'s doc heading'
		<AREA>
			<CTRL_GROUP>
				FMT={
					par.style='s2';
				}
				<CTRLS>
					<DATA_CTRL>
						ATTR='xmlName'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
			<CTRL_GROUP>
				FMT={
					par.style='s1';
				}
				<CTRLS>
					<DATA_CTRL>
						FORMULA='getAttrStringValue("xmlURI") + " -- " + dateTime()'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
			<SPACER>
				FMT={
					spacer.height='10';
				}
			</SPACER>
		</AREA>
	</AREA_SEC>
	<AREA_SEC>
		DESCR='XML declaration'
		COND='getAttrValue("xmlDecl") != ""'
		<AREA>
			<CTRL_GROUP>
				FMT={
					txtfl.delimiter.type='none';
				}
				<CTRLS>
					<DATA_CTRL>
						ATTR='xmlDecl'
						FMT={
							text.style='cs20';
						}
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<ELEMENT_ITER>
		DESCR='iterates by all nodes in the XML'
		TARGET_ET='<ANY>'
		SCOPE='simple-location-rules'
		RULES={
			'* -> *';
		}
		<BODY>
			<FOLDER>
				DESCR='processes <!DOCTYPE> node'
				MATCHING_ET='#DOCTYPE'
				BREAK_PARENT_BLOCK='when-executed'
				<BODY>
					<ELEMENT_ITER>
						DESCR='print Internal Subset'
						INIT_EXPR='thisContext.setVar ("comment", false)'
						COLLAPSED
						TARGET_ET='#CUSTOM'
						SCOPE='custom'
						ELEMENT_ENUM_EXPR='breakString (
  getAttrStringValue("internalSubset").trim(),
  Array ("<!--", "-->"),
  false,
  true
).toCustomElements()'
						FMT={
							sec.outputStyle='text-par';
							txtfl.delimiter.type='none';
							par.margin.left='9';
						}
						<BODY>
							<FOLDER>
								DESCR='comments not started'
								COND='! thisContext.getBooleanVar ("comment")'
								BREAK_PARENT_BLOCK='when-executed'
								<BODY>
									<AREA_SEC>
										DESCR='start of comments'
										COND='contextElement.value == "<!--"'
										INIT_EXPR='thisContext.setVar ("comment", true)'
										BREAK_PARENT_BLOCK='when-executed'
										<AREA>
											<CTRL_GROUP>
												FMT={
													txtfl.delimiter.type='none';
												}
												<CTRLS>
													<TEXT_CTRL>
														TEXT='<!--'
														FMT={
															text.style='cs14';
														}
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</AREA_SEC>
									<AREA_SEC>
										DESCR='internal subset definitions'
										<AREA>
											<CTRL_GROUP>
												FMT={
													txtfl.delimiter.type='none';
												}
												<CTRLS>
													<DATA_CTRL>
														ELEMENT_VALUE
														FMT={
															ctrl.option.text.collapseSpaces='true';
															text.style='cs18';
															text.option.renderNLs='true';
														}
													</DATA_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</AREA_SEC>
								</BODY>
							</FOLDER>
							<FOLDER>
								DESCR='comments started'
								<BODY>
									<AREA_SEC>
										DESCR='end of comments'
										COND='contextElement.value == "-->"'
										INIT_EXPR='thisContext.setVar ("comment", false)'
										BREAK_PARENT_BLOCK='when-executed'
										<AREA>
											<CTRL_GROUP>
												FMT={
													txtfl.delimiter.type='none';
												}
												<CTRLS>
													<TEXT_CTRL>
														TEXT='-->'
														FMT={
															text.style='cs14';
														}
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</AREA_SEC>
									<AREA_SEC>
										DESCR='comments text'
										<AREA>
											<CTRL_GROUP>
												FMT={
													txtfl.delimiter.type='none';
												}
												<CTRLS>
													<DATA_CTRL>
														ELEMENT_VALUE
														FMT={
															ctrl.option.text.collapseSpaces='true';
															text.style='cs13';
															text.option.renderNLs='true';
														}
													</DATA_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</AREA_SEC>
								</BODY>
							</FOLDER>
						</BODY>
					</ELEMENT_ITER>
				</BODY>
				<HEADER>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									text.style='cs15';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT='<!DOCTYPE'
									</TEXT_CTRL>
									<DATA_CTRL>
										ATTR='name'
									</DATA_CTRL>
									<PANEL>
										COND='getAttrStringValue("publicId") != ""'
										FMT={
											ctrl.size.width='127.5';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														TEXT='PUBLIC'
													</TEXT_CTRL>
													<DELIMITER>
													</DELIMITER>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
													<DATA_CTRL>
														ATTR='publicId'
														FMT={
															ctrl.option.text.noBlankOutput='true';
														}
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
									<PANEL>
										COND='getAttrStringValue("systemId") != ""'
										FMT={
											ctrl.size.width='127.5';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														COND='getAttrStringValue("publicId") == ""'
														TEXT='SYSTEM'
													</TEXT_CTRL>
													<DELIMITER>
													</DELIMITER>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
													<DATA_CTRL>
														ATTR='systemId'
														FMT={
															ctrl.option.text.noBlankOutput='true';
														}
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
									<TEXT_CTRL>
										TEXT='['
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
				<FOOTER>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									text.style='cs15';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT=']>'
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</FOOTER>
				<ELSE>
					DESCR='simple case of <!DOCTYPE> node (without internal subset)'
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									text.style='cs15';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT='<!DOCTYPE'
									</TEXT_CTRL>
									<DATA_CTRL>
										ATTR='name'
									</DATA_CTRL>
									<PANEL>
										COND='getAttrStringValue("publicId") != ""'
										FMT={
											ctrl.size.width='127.5';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														TEXT='PUBLIC'
													</TEXT_CTRL>
													<DELIMITER>
													</DELIMITER>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
													<DATA_CTRL>
														ATTR='publicId'
														FMT={
															ctrl.option.text.noBlankOutput='true';
														}
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
									<PANEL>
										COND='getAttrStringValue("systemId") != ""'
										FMT={
											ctrl.size.width='127.5';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														COND='getAttrStringValue("publicId") == ""'
														TEXT='SYSTEM'
													</TEXT_CTRL>
													<DELIMITER>
													</DELIMITER>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
													<DATA_CTRL>
														ATTR='systemId'
														FMT={
															ctrl.option.text.noBlankOutput='true';
														}
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT='"'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
									<DELIMITER>
										FMT={
											txtfl.delimiter.type='none';
										}
									</DELIMITER>
									<TEXT_CTRL>
										TEXT='>'
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</ELSE>
			</FOLDER>
			<SS_CALL>
				DESCR='processes other XML nodes'
				SS_NAME='Node'
			</SS_CALL>
		</BODY>
	</ELEMENT_ITER>
	<TEMPLATE_CALL>
		DESCR='Bottom Message'
		COND='output.type == "document"'
		TEMPLATE_FILE='about.tpl'
	</TEMPLATE_CALL>
</ROOT>
<STOCK_SECTIONS>
	<ATTR_ITER>
		SS_NAME='AttrList'
		DESCR='generates list of the element\'s attributes'
		SCOPE='enumerated-attrs'
		EXCL_PASSED=false
		FMT={
			sec.outputStyle='text-par';
			txtfl.delimiter.type='none';
		}
		<BODY>
			<AREA_SEC>
				COND='iterator.attr.name.startsWith ("xml") && {
  name = iterator.attr.name;
  name.startsWith ("xml:") || name == "xmlns" ||
  name.startsWith ("xmlns:")
}'
				BREAK_PARENT_BLOCK='when-executed'
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<DELIMITER>
								FMT={
									text.style='cs5';
								}
							</DELIMITER>
							<DATA_CTRL>
								FORMULA='iterator.attr.name'
								FMT={
									text.style='cs7';
								}
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='="'
								FMT={
									text.style='cs19';
								}
							</TEXT_CTRL>
							<DATA_CTRL>
								FORMULA='iterator.attr.value'
								FMT={
									text.style='cs9';
								}
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='"'
								FMT={
									text.style='cs19';
								}
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<DELIMITER>
								FMT={
									text.style='cs5';
								}
							</DELIMITER>
							<DATA_CTRL>
								FORMULA='iterator.attr.name'
								FMT={
									text.style='cs6';
								}
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='="'
								FMT={
									text.style='cs19';
								}
							</TEXT_CTRL>
							<DATA_CTRL>
								FORMULA='encodeXMLChars (
  iterator.value.toString(),
  true, true, true, false
)'
								FMT={
									text.style='cs8';
									text.hlink.fmt='style';
									text.hlink.style='cs3';
								}
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='"'
								FMT={
									text.style='cs19';
								}
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</BODY>
	</ATTR_ITER>
	<FOLDER>
		SS_NAME='Node'
		DESCR='This stock-section processes a node which may contain similar nodes within itself'
		<BODY>
			<FOLDER>
				DESCR='case of element node'
				COND='! contextElement.pseudoElement'
				BREAK_PARENT_BLOCK='when-executed'
				<HTARGET>
					COND='hasChild("#NAMESPACE")'
					HKEYS={
						'contextElement.id';
						'"xmlns"';
					}
				</HTARGET>
				<BODY>
					<AREA_SEC>
						DESCR='this is executed only when the element contains a short text (in order to produce a single-line output)'
						COND='countChildren ("*") == 1 &&
(text = getValueByLPath ("#TEXT")) != null && {
  s = text.toString();
  s.len() < 50 && ! s.contains ("\\n")
}'
						BREAK_PARENT_BLOCK='when-executed'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT='<'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
									<DATA_CTRL>
										FORMULA='contextElement.name'
										FMT={
											text.style='cs16';
										}
									</DATA_CTRL>
									<SS_CALL_CTRL>
										SS_NAME='AttrList'
									</SS_CALL_CTRL>
									<TEXT_CTRL>
										TEXT='>'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
									<DATA_CTRL>
										FORMULA='encodeXMLChars (
  getValueByLPath ("#TEXT").toString()
)'
										FMT={
											ctrl.option.text.collapseSpaces='true';
											ctrl.option.text.trimSpaces='true';
											text.style='cs17';
										}
									</DATA_CTRL>
									<TEXT_CTRL>
										TEXT='</'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
									<DATA_CTRL>
										FORMULA='contextElement.name'
										FMT={
											text.style='cs16';
										}
									</DATA_CTRL>
									<TEXT_CTRL>
										TEXT='>'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<ELEMENT_ITER>
						DESCR='iterates by the element\'s child nodes -- the case of a complex element'
						BREAK_PARENT_BLOCK='when-output'
						TARGET_ET='<ANY>'
						SCOPE='simple-location-rules'
						RULES={
							'* -> *';
						}
						<BODY>
							<SS_CALL>
								DESCR='calls this stock-section recursively'
								SS_NAME='Node'
								FMT={
									sec.indent.left='9';
								}
							</SS_CALL>
						</BODY>
						<HEADER>
							<AREA_SEC>
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<TEXT_CTRL>
												TEXT='<'
												FMT={
													text.style='cs19';
												}
											</TEXT_CTRL>
											<DATA_CTRL>
												FORMULA='contextElement.name'
												FMT={
													text.style='cs16';
												}
											</DATA_CTRL>
											<SS_CALL_CTRL>
												SS_NAME='AttrList'
											</SS_CALL_CTRL>
											<TEXT_CTRL>
												TEXT='>'
												FMT={
													text.style='cs19';
												}
											</TEXT_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</HEADER>
						<FOOTER>
							<AREA_SEC>
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<TEXT_CTRL>
												TEXT='</'
												FMT={
													text.style='cs19';
												}
											</TEXT_CTRL>
											<DATA_CTRL>
												FORMULA='contextElement.name'
												FMT={
													text.style='cs16';
												}
											</DATA_CTRL>
											<TEXT_CTRL>
												TEXT='>'
												FMT={
													text.style='cs19';
												}
											</TEXT_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</FOOTER>
					</ELEMENT_ITER>
					<AREA_SEC>
						DESCR='this is executed when no child nodes encountered -- the case of a simple element'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT='<'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
									<DATA_CTRL>
										FORMULA='contextElement.name'
										FMT={
											text.style='cs16';
										}
									</DATA_CTRL>
									<SS_CALL_CTRL>
										SS_NAME='AttrList'
									</SS_CALL_CTRL>
									<TEXT_CTRL>
										TEXT='/>'
										FMT={
											text.style='cs19';
										}
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<AREA_SEC>
				DESCR='TEXT node'
				MATCHING_ET='#TEXT'
				BREAK_PARENT_BLOCK='when-executed'
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<DATA_CTRL>
								FORMULA='encodeXMLChars (contextElement.value.toString())'
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.trimSpaces='true';
									ctrl.option.text.noEmptyOutput='true';
									text.style='cs17';
									text.option.renderNLs='true';
								}
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<AREA_SEC>
				DESCR='COMMENT node'
				MATCHING_ET='#COMMENT'
				BREAK_PARENT_BLOCK='when-executed'
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='none';
						}
						<CTRLS>
							<TEXT_CTRL>
								TEXT='<!--'
								FMT={
									text.style='cs14';
								}
							</TEXT_CTRL>
							<DATA_CTRL>
								ELEMENT_VALUE
								FMT={
									ctrl.option.text.collapseSpaces='true';
									text.style='cs13';
									text.option.renderNLs='true';
								}
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='-->'
								FMT={
									text.style='cs14';
								}
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<AREA_SEC>
				DESCR='CDATA node'
				MATCHING_ET='#CDATA'
				BREAK_PARENT_BLOCK='when-executed'
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<TEXT_CTRL>
								TEXT='<![CDATA['
								FMT={
									text.style='cs12';
								}
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
					<CTRL_GROUP>
						FMT={
							text.style='cs11';
							par.margin.left='9';
						}
						<CTRLS>
							<DATA_CTRL>
								ELEMENT_VALUE
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.trimSpaces='true';
									text.option.renderNLs='true';
								}
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
					<CTRL_GROUP>
						<CTRLS>
							<TEXT_CTRL>
								TEXT=']]>'
								FMT={
									text.style='cs12';
								}
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<AREA_SEC>
				DESCR='Processing Instruction node'
				MATCHING_ET='#PI'
				FMT={
					text.style='cs20';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='none';
						}
						<CTRLS>
							<TEXT_CTRL>
								TEXT='<?'
							</TEXT_CTRL>
							<DATA_CTRL>
								ATTR='target'
							</DATA_CTRL>
							<DELIMITER>
							</DELIMITER>
							<DATA_CTRL>
								ELEMENT_VALUE
							</DATA_CTRL>
							<TEXT_CTRL>
								TEXT='?>'
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</BODY>
	</FOLDER>
</STOCK_SECTIONS>
CHECKSUM='buYz1+6jsCz9QVYrTk3DO5d+nLxaQrxFTsXhF3937ko'
</DOCFLEX_TEMPLATE>