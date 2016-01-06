<DOCFLEX_TEMPLATE VER='1.19'>
CREATED='2008-02-16 07:07:55'
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
ROOT_ET='xs:%facet'
<TEMPLATE_PARAMS>
	PARAM={
		param.name='$facet.annotation';
		param.title='Include Annotations';
		param.type='boolean';
		param.defaultValue='true';
	}
	PARAM={
		param.name='fmt';
		param.title='Formatting';
		param.title.style.bold='true';
		param.group='true';
	}
	PARAM={
		param.name='fmt.allowNestedTables';
		param.title='Allow nested tables';
		param.type='boolean';
		param.defaultValue='true';
	}
</TEMPLATE_PARAMS>
<STYLES>
	CHAR_STYLE={
		style.name='Annotation Smallest';
		style.id='cs1';
		text.font.name='Arial';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='Code Smaller';
		style.id='cs2';
		text.font.name='Courier New';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs3';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs4';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s1';
		style.default='true';
	}
</STYLES>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs4';
}
<ROOT>
	<FOLDER>
		DESCR='CASE OF ENUMERATIOM -- switch the context element back to the container'
		COND='instanceOf("xs:enumeration")'
		CONTEXT_ELEMENT_EXPR='contextElement.predecessor'
		MATCHING_ETS={'xs:%restrictionType';'xs:restriction'}
		BREAK_PARENT_BLOCK='when-executed'
		<BODY>
			<FOLDER>
				DESCR='if there is at least one annotation within the <xs:enumeration> elements'
				COND='getBooleanParam("$facet.annotation")
&&
checkElementsByLPath(
  "xs:enumeration/xs:annotation/xs:documentation"
)'
				BREAK_PARENT_BLOCK='when-executed'
				<BODY>
					<ELEMENT_ITER>
						DESCR='if nested tables are allowed'
						COND='getBooleanParam("fmt.allowNestedTables")'
						BREAK_PARENT_BLOCK='when-executed'
						TARGET_ET='xs:enumeration'
						SCOPE='simple-location-rules'
						RULES={
							'* -> xs:enumeration';
						}
						FMT={
							sec.outputStyle='table';
							txtfl.delimiter.type='text';
							txtfl.delimiter.text=', ';
							table.cell.padding.both='0';
							table.border.style='none';
						}
						<BODY>
							<AREA_SEC>
								COND='checkStockSectionOutput("annotation")'
								BREAK_PARENT_BLOCK='when-executed'
								FMT={
									trow.cell.align.vert='Top';
									trow.cell.padding.extra.bottom='0.2';
								}
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<PANEL>
												FMT={
													ctrl.size.width='79.5';
													ctrl.size.height='38.3';
													text.style='cs2';
													text.option.nbsps='true';
												}
												<AREA>
													<CTRL_GROUP>
														<CTRLS>
															<TEXT_CTRL>
																TEXT='"'
															</TEXT_CTRL>
															<DATA_CTRL>
																ATTR='value'
															</DATA_CTRL>
															<TEXT_CTRL>
																TEXT='"'
															</TEXT_CTRL>
														</CTRLS>
													</CTRL_GROUP>
												</AREA>
											</PANEL>
											<PANEL>
												FMT={
													ctrl.size.width='57.8';
													ctrl.size.height='38.3';
													text.style='cs1';
													text.option.nbsps='true';
													par.option.nowrap='true';
												}
												<AREA>
													<CTRL_GROUP>
														<CTRLS>
															<TEXT_CTRL>
																TEXT=' '
															</TEXT_CTRL>
															<TEXT_CTRL>
																TEXT='-'
																FMT={
																	text.style='cs2';
																}
															</TEXT_CTRL>
															<TEXT_CTRL>
																TEXT=' '
															</TEXT_CTRL>
														</CTRLS>
													</CTRL_GROUP>
												</AREA>
											</PANEL>
											<SS_CALL_CTRL>
												SS_NAME='annotation'
												FMT={
													ctrl.size.width='362.3';
													ctrl.size.height='38.3';
													text.style='cs1';
												}
											</SS_CALL_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
							<AREA_SEC>
								FMT={
									trow.cell.align.vert='Top';
									trow.cell.padding.extra.bottom='0.2';
								}
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<PANEL>
												FMT={
													ctrl.size.width='499.5';
													ctrl.size.height='38.3';
													text.style='cs2';
													text.option.nbsps='true';
												}
												<AREA>
													<CTRL_GROUP>
														<CTRLS>
															<TEXT_CTRL>
																TEXT='"'
															</TEXT_CTRL>
															<DATA_CTRL>
																ATTR='value'
															</DATA_CTRL>
															<TEXT_CTRL>
																TEXT='"'
															</TEXT_CTRL>
														</CTRLS>
													</CTRL_GROUP>
												</AREA>
											</PANEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</BODY>
					</ELEMENT_ITER>
					<ELEMENT_ITER>
						DESCR='if nested tables are not allowed'
						TARGET_ET='xs:enumeration'
						SCOPE='simple-location-rules'
						RULES={
							'* -> xs:enumeration';
						}
						<BODY>
							<AREA_SEC>
								FMT={
									sec.outputStyle='text-par';
									text.style='cs1';
								}
								<AREA>
									<CTRL_GROUP>
										FMT={
											txtfl.delimiter.type='none';
										}
										<CTRLS>
											<PANEL>
												FMT={
													ctrl.size.width='79.5';
													ctrl.size.height='38.3';
													text.style='cs2';
													text.option.nbsps='true';
												}
												<AREA>
													<CTRL_GROUP>
														<CTRLS>
															<TEXT_CTRL>
																TEXT='"'
															</TEXT_CTRL>
															<DATA_CTRL>
																ATTR='value'
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
													txtfl.delimiter.type='text';
													txtfl.delimiter.text=' - ';
												}
											</DELIMITER>
											<SS_CALL_CTRL>
												SS_NAME='annotation'
											</SS_CALL_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</BODY>
					</ELEMENT_ITER>
				</BODY>
			</FOLDER>
			<ELEMENT_ITER>
				DESCR='otherwise, there are no annotations whithin <xs:enumeration> elements; print the enumeration values as a plain comma-delimited list'
				TARGET_ET='xs:enumeration'
				SCOPE='simple-location-rules'
				RULES={
					'* -> xs:enumeration';
				}
				FMT={
					sec.outputStyle='text-par';
					text.style='cs2';
				}
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<TEXT_CTRL>
										TEXT='"'
									</TEXT_CTRL>
									<DATA_CTRL>
										ATTR='value'
										FMT={
											text.option.nbsps='true';
										}
									</DATA_CTRL>
									<TEXT_CTRL>
										TEXT='"'
									</TEXT_CTRL>
									<DELIMITER>
										FMT={
											txtfl.delimiter.type='text';
											txtfl.delimiter.text=', ';
										}
									</DELIMITER>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</ELEMENT_ITER>
		</BODY>
	</FOLDER>
	<FOLDER>
		DESCR='CASE OF OTHER FACETS'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<DATA_CTRL>
								ATTR='value'
								FMT={
									text.style='cs2';
								}
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<SS_CALL>
				DESCR='facet annotation'
				COND='getBooleanParam("$facet.annotation")'
				SS_NAME='annotation'
				FMT={
					sec.spacing.before='3.3';
					text.style='cs1';
				}
			</SS_CALL>
		</BODY>
	</FOLDER>
</ROOT>
<STOCK_SECTIONS>
	<TEMPLATE_CALL>
		SS_NAME='annotation'
		MATCHING_ET='xs:%annotated'
		TEMPLATE_FILE='../ann/annotation.tpl'
		FMT={
			par.lineHeight='0';
		}
	</TEMPLATE_CALL>
</STOCK_SECTIONS>
CHECKSUM='fgHEKmeT9nARTcJbZtp7DotZ645NZIwcWenHCKPaOcM'
</DOCFLEX_TEMPLATE>