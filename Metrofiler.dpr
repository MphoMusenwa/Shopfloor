program Metrofiler;





{%TogetherDiagram 'ModelSupport_Metrofiler\default.txaPackage'}

uses
  Forms,
  controls,
  main in 'main.pas' {frm_Console},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  Security in 'Security.pas' {frm_Security},
  Period in 'Period.pas' {frm_Period},
  Address in 'Address.pas' {frm_Address},
  IndexDefinitions in 'IndexDefinitions.pas' {frm_IndexDefinitions},
  Delivery in 'Delivery.pas' {frm_DeliveryType},
  Retrievals in 'Retrievals.pas' {frm_Retrievals},
  Location in 'Location.pas' {frm_Locations},
  TransView in 'TransView.pas' {frm_TransView},
  Logon in 'Logon.pas' {PasswordDlg},
  whouse in 'whouse.pas' {frm_Warehouse},
  Req in 'Req.pas' {frm_Requisitions},
  DataModCap in 'DataModCap.pas' {DatModCap: TDataModule},
  Processing in 'Processing.pas' {frm_Processing},
  DataModReq in 'DataModReq.pas' {DatModReq: TDataModule},
  ScanEntries in 'ScanEntries.pas' {frm_ScanEntries},
  ItemsOut in 'ItemsOut.pas' {frm_ItemsOut},
  ContainerSearch in 'ContainerSearch.pas' {frm_ContainerSearch},
  SelContainer in 'SelContainer.pas' {frm_SelOffsiteContainer},
  ContType in 'ContType.pas' {frm_ContTypes},
  MRegister in 'MRegister.pas' {frm_Register},
  SelBranch in 'SelBranch.pas' {frm_SelBranch},
  SelDept in 'SelDept.pas' {frm_SelDept},
  SelWHouse in 'SelWHouse.pas' {frm_SelWhouse},
  SelRType in 'SelRType.pas' {frm_SelRType},
  DirDlg in 'DirDlg.pas',
  SelOffSiteBoxDetails in 'SelOffSiteBoxDetails.pas' {frm_SelOffSiteBoxDetails},
  SelPickDet in 'SelPickDet.pas' {frm_SelPickDet},
  Receiving in 'Receiving.pas' {frm_Receiving},
  repFilesInuseputawaynottracked in 'repFilesInuseputawaynottracked.pas' {frm_FilesInuseputawaynottracked},
  DataVer in 'DataVer.pas' {frm_DataVer},
  RecordLookup in 'RecordLookup.pas' {frm_RecordLookup},
  OffSiteExporttoFile in 'OffSiteExporttoFile.pas' {frm_OffsiteExporttoFile},
  framPutAwayFileItem in 'framPutAwayFileItem.pas' {fram_PutAwayFileItem: TFrame},
  ChangeOffSiteRecsCont in 'ChangeOffSiteRecsCont.pas' {frm_changeOffSiteRecsCont},
  SelFromToDate in 'SelFromToDate.pas' {frm_SelFromToDates},
  rep_Destruction in 'rep_Destruction.pas' {frm_Destruction},
  rep_FilesOut in 'rep_FilesOut.pas' {frm_FilesWithDrawn},
  rep_RHistory in 'rep_RHistory.pas' {frm_RetrieveHistory},
  rep_SchDestruct in 'rep_SchDestruct.pas' {frm_OutSched},
  Rep_WhCont in 'Rep_WhCont.pas' {frm_Rep_WhCont},
  repCapturedContAmt in 'repCapturedContAmt.pas' {rep_CapturedContAmt},
  repCapturedContList in 'repCapturedContList.pas' {rep_CapturedContList},
  repCapturedRecAmt in 'repCapturedRecAmt.pas' {rep_CapturedRecAmt},
  repCapturedRecList in 'repCapturedRecList.pas' {rep_CapturedRecList},
  repContSAtoIA in 'repContSAtoIA.pas' {rep_ContSAtoIA},
  repDesContAmt in 'repDesContAmt.pas' {rep_DesContAmt},
  repDesContList in 'repDesContList.pas' {rep_DesContList},
  repDesRecAmt in 'repDesRecAmt.pas' {rep_DesRecAmt},
  repDesRecList in 'repDesRecList.pas' {rep_DesRecList},
  repListofCont_FullDetails in 'repListofCont_FullDetails.pas' {rep_ListContFullDet},
  repListRecordTypes in 'repListRecordTypes.pas' {rep_ListRecordTypes},
  repOffsiteConContents in 'repOffsiteConContents.pas' {rep_OffSiteConContents},
  repOffSiteContAmt in 'repOffSiteContAmt.pas' {rep_OffSiteContAmt},
  repOffSiteContList in 'repOffSiteContList.pas' {rep_OffSiteContList},
  repOffSiteRecAmt in 'repOffSiteRecAmt.pas' {rep_OffSiteRecAmt},
  repOffSiteRecList in 'repOffSiteRecList.pas' {rep_OffSiteRecList},
  repRecContinSys in 'repRecContinSys.pas' {rep_RecContinSys},
  repRequisitionsDaily in 'repRequisitionsDaily.pas' {rep_RequisitionsDaily},
  repRetContAmt in 'repRetContAmt.pas' {rep_RetContAmt},
  repRetContList in 'repRetContList.pas' {rep_RetContList},
  repRetRecAmt in 'repRetRecAmt.pas' {rep_RetRecAmt},
  repRetRecList in 'repRetRecList.pas' {rep_RetRecList},
  repReturnsPutawaysDaily in 'repReturnsPutawaysDaily.pas' {rep_ReturnsPutawaysDaily},
  repWorkCaptured in 'repWorkCaptured.pas' {rep_workCaptured},
  MetroTrackRep in 'MetroTrackRep.pas' {frm_MetroTrackRep},
  MetrofilerDataModule in 'MetrofilerDataModule.pas' {dm_Metrofiler: TDataModule},
  repListContRec in 'repListContRec.pas' {rep_ListContRecords},
  eRecords in 'eRecords.pas' {frm_eRecords},
  RecCat in 'RecCat.pas' {frm_RecCat},
  RecCatLookup in 'RecCatLookup.pas' {frm_RecCatLookup},
  ePending in 'ePending.pas' {frm_ePending},
  SelBarcode in 'SelBarcode.pas' {frm_SelBarcode},
  SelRCat in 'SelRCat.pas' {frm_SelRCat},
  ImgCentre in 'ImgCentre.pas' {frm_ImageCentre},
  BulkImport in 'BulkImport.pas' {frm_BulkImport},
  eRecSrchSpec in 'eRecSrchSpec.pas' {frm_SearcheRecords},
  framImageViewer in 'framImageViewer.pas' {fram_ImageViewer: TFrame},
  eRecSrchQry in 'eRecSrchQry.pas' {frm_SearcheRecordsCross},
  framHTMLViewer in 'framHTMLViewer.pas' {fram_HTMLViewer: TFrame},
  ImageAnnote in 'ImageAnnote.pas' {frm_ImageAnnote},
  framThumbnails in 'framThumbnails.pas' {fram_Thumbnails: TFrame},
  ePendingLinkFile in 'ePendingLinkFile.pas' {frm_ePendingLinkFile},
  eRecDataMan in 'eRecDataMan.pas' {frm_eRecDataMan},
  Getdate in 'Getdate.pas' {frm_GetDate},
  RecordComments in 'RecordComments.pas' {frm_RecordComments},
  ManualRetrieval in 'ManualRetrieval.pas' {frm_ManualRetrieval},
  repGenerator in 'repGenerator.pas' {frm_RepGenerator},
  framRichEditViewer in 'framRichEditViewer.pas' {fram_RTFViewer: TFrame},
  IndexDefsRelations in 'IndexDefsRelations.pas' {frm_IndexDefsRelations},
  ChangeDet in 'ChangeDet.pas' {frm_ChangeDet},
  AddImages in 'AddImages.pas' {frm_AddImages},
  Progress in 'Progress.pas' {frm_Progress},
  VerifyDesPWMET in 'VerifyDesPWMET.pas' {frm_VerifyDesPWMET},
  RetSched in 'RetSched.pas' {frm_RetSched},
  Secure in 'Secure.pas',
  ContainerComments in 'ContainerComments.pas' {frm_ContainerComments},
  ePendingLinkItem in 'ePendingLinkItem.pas' {frm_ePendingLinkItem},
  BranchesDepartments in 'BranchesDepartments.pas' {frm_BranchesDepartments},
  Registration in 'Registration.pas',
  AccessUserRole in 'AccessUserRole.pas' {frm_AccessUserRole},
  AccessUserFilingArea in 'AccessUserFilingArea.pas' {frm_AccessUserFilingArea},
  AccessUserRecordCat in 'AccessUserRecordCat.pas' {frm_AccessUserRecordCat},
  AccessUserRecordType in 'AccessUserRecordType.pas' {frm_AccessUserRecordType},
  AccessRoleFilingArea in 'AccessRoleFilingArea.pas' {frm_AccessRoleFilingArea},
  AccessRoleRecordCat in 'AccessRoleRecordCat.pas' {frm_AccessRoleRecordCat},
  AccessRoleRecordType in 'AccessRoleRecordType.pas' {frm_AccessRoleRecordType},
  AccessRoleUser in 'AccessRoleUser.pas' {frm_AccessRoleUser},
  AccessUserSystem in 'AccessUserSystem.pas' {frm_AccessUserSystem},
  AccessRoleSystem in 'AccessRoleSystem.pas' {frm_AccessRoleSystem},
  IndexDefinitionsSelBranch in 'IndexDefinitionsSelBranch.pas' {frm_IndexDefinitionsSelBranch},
  IndexDefinitionsSelDept in 'IndexDefinitionsSelDept.pas' {frm_IndexDefinitionsSelDept},
  BulkCapture in 'BulkCapture.pas' {frm_BulkCapture},
  ProxyLocations in 'ProxyLocations.pas' {frm_ProxyLocactions},
  Reports in 'Reports.pas' {frm_Reports},
  ReportsResult in 'ReportsResult.pas' {frm_ReportResult},
  AccessUserReports in 'AccessUserReports.pas' {frm_AccessUserReports},
  AccessRoleReports in 'AccessRoleReports.pas' {frm_AccessRoleReports},
  IndexDefinitionsMatch in 'IndexDefinitionsMatch.pas' {frm_IndexDefsMatch},
  framDataManagerERecords in 'framDataManagerERecords.pas' {fram_eRecDataManager: TFrame},
  BulkImportPurge in 'BulkImportPurge.pas' {frm_BulkImportPurge},
  framDataManager in 'framDataManager.pas' {fram_DataManager: TFrame},
  DataMan in 'DataMan.pas' {frm_DataMan},
  ScannerConfig in 'ScannerConfig.pas' {frm_ScannerConfig},
  Filing in 'Filing.pas' {frm_Filing},
  framPutFilesintoContainer in 'framPutFilesintoContainer.pas' {fram_PutFilesintoContainer: TFrame},
  framViewLocationFilesItems in 'framViewLocationFilesItems.pas' {fram_ViewLocationFilesItems: TFrame},
  framViewLocationContainers in 'framViewLocationContainers.pas' {fram_ViewLocationContainers: TFrame},
  framAuditLocFiles in 'framAuditLocFiles.pas' {fram_AuditLocFiles: TFrame},
  framPutAwayContainers in 'framPutAwayContainers.pas' {fram_PutAwayContainers: TFrame},
  framAuditLocItems in 'framAuditLocItems.pas' {fram_AuditLocItems: TFrame},
  eRecExport in 'eRecExport.pas' {frm_eRecExport},
  AccessUserDeliveryType in 'AccessUserDeliveryType.pas' {frm_AccessUserDeliveryType},
  AccessRoleDeliveryType in 'AccessRoleDeliveryType.pas' {frm_AccessRoleDeliveryType},
  MetroImp in 'MetroImp.pas' {frm_DataImpMatch},
  SelSystemUser in 'SelSystemUser.pas' {frm_SelSystemUser},
  ChangeBarcode in 'ChangeBarcode.pas' {frm_ChangeBarcode},
  AddCOOLField in 'AddCOOLField.pas' {frm_AddCOOLField},
  COOL in 'COOL.pas' {frm_COOL},
  COOLSrchQry in 'COOLSrchQry.pas' {frm_COOLSearchCross},
  COOLSrchSpec in 'COOLSrchSpec.pas' {frm_COOLSearchSpecific},
  framCOOLImageViewer in 'framCOOLImageViewer.pas' {fram_COOLImageViewer: TFrame},
  eRecordsCommentAdd in 'eRecordsCommentAdd.pas' {frm_eRecordsCommentAdd},
  eRecordsForward in 'eRecordsForward.pas' {frm_eRecordsForward},
  LicenseAgreement in 'LicenseAgreement.pas' {frm_LicenseTerms},
  Actions in 'Actions.pas' {frm_Actions},
  FileCoversheet in 'FileCoversheet.pas' {frm_FileCoversheet},
  ItemCoversheet in 'ItemCoversheet.pas' {frm_ItemCoversheet},
  AccessDeliveryType in 'AccessDeliveryType.pas' {frm_AccessDeliveryType},
  AccessFilingArea in 'AccessFilingArea.pas' {frm_AccessFilingArea},
  AccessRecordCat in 'AccessRecordCat.pas' {frm_AccessRecordCat},
  AccessImageCentreGroup in 'AccessImageCentreGroup.pas' {frm_AccessImageCentreGroup},
  AccessProxyLoc in 'AccessProxyLoc.pas' {frm_AccessProxyLoc},
  edtBarcodeRange in 'edtBarcodeRange.pas' {frm_edtBarcodeRange},
  framMoveLocations in 'framMoveLocations.pas' {fram_MoveLocations: TFrame},
  eRecordFilter in 'eRecordFilter.pas' {frm_eRecordFullTextFilter},
  RelRecordTypeRecordCat in 'RelRecordTypeRecordCat.pas' {frm_RelRecordTypeRecordCat},
  BulkCaptureReCapture in 'BulkCaptureReCapture.pas' {frm_BulkCaptureReclassify},
  DBConfig in 'DBConfig.pas' {frm_DatabaseConfig};

{$R *.RES}

begin
  Application.Initialize;
  Application.ShowHint := True;
  Application.Title := 'Metrofiler';
  Application.HelpFile := 'Mfhlp.hlp';
  Application.CreateForm(Tdm_Metrofiler, dm_Metrofiler);
  Application.CreateForm(Tfrm_Console, frm_Console);
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.lbl_Reg.Visible := False;
  AboutBox.Show;
  Screen.Cursor := crAppStart;
  Application.ProcessMessages;
  try
    Application.CreateForm(Tfrm_BulkCaptureReclassify, frm_BulkCaptureReclassify);
    Application.CreateForm(Tfrm_edtBarcodeRange, frm_edtBarcodeRange);
    Application.CreateForm(Tfrm_eRecordFullTextFilter, frm_eRecordFullTextFilter);
    Application.CreateForm(Tfrm_RelRecordTypeRecordCat, frm_RelRecordTypeRecordCat);
    Application.CreateForm(Tfrm_AccessImageCentreGroup, frm_AccessImageCentreGroup);
    Application.CreateForm(Tfrm_eRecordsCommentAdd, frm_eRecordsCommentAdd);
    Application.CreateForm(Tfrm_COOLSearchCross, frm_COOLSearchCross);
    Application.CreateForm(Tfrm_COOLSearchSpecific, frm_COOLSearchSpecific);
    Application.CreateForm(Tfrm_AddCOOLField, frm_AddCOOLField);
    Application.CreateForm(Tfrm_SelSystemUser, frm_SelSystemUser);
    Application.CreateForm(Tfrm_DataImpMatch, frm_DataImpMatch);
    Application.CreateForm(Tfrm_AccessRoleDeliveryType, frm_AccessRoleDeliveryType);
    Application.CreateForm(Tfrm_AccessUserDeliveryType, frm_AccessUserDeliveryType);
    Application.CreateForm(Tfrm_AccessDeliveryType, frm_AccessDeliveryType);
    Application.CreateForm(Tfrm_ScannerConfig, frm_ScannerConfig);
    Application.CreateForm(Tfrm_IndexDefsMatch, frm_IndexDefsMatch);
    Application.CreateForm(Tfrm_AccessRoleReports, frm_AccessRoleReports);
    Application.CreateForm(Tfrm_AccessUserReports, frm_AccessUserReports);
    Application.CreateForm(Tfrm_AccessProxyLoc, frm_AccessProxyLoc);
    Application.CreateForm(Tfrm_IndexDefinitionsSelBranch, frm_IndexDefinitionsSelBranch);
    Application.CreateForm(Tfrm_IndexDefinitionsSelDept, frm_IndexDefinitionsSelDept);
    Application.CreateForm(Tfrm_AccessRecordCat, frm_AccessRecordCat);
    Application.CreateForm(Tfrm_AccessFilingArea, frm_AccessFilingArea);
    Application.CreateForm(Tfrm_AccessRoleSystem, frm_AccessRoleSystem);
    Application.CreateForm(Tfrm_AccessRoleFilingArea, frm_AccessRoleFilingArea);
    Application.CreateForm(Tfrm_AccessRoleRecordCat, frm_AccessRoleRecordCat);
    Application.CreateForm(Tfrm_AccessRoleRecordType, frm_AccessRoleRecordType);
    Application.CreateForm(Tfrm_AccessRoleUser, frm_AccessRoleUser);
    Application.CreateForm(Tfrm_AccessUserSystem, frm_AccessUserSystem);
    Application.CreateForm(Tfrm_AccessUserRecordType, frm_AccessUserRecordType);
    Application.CreateForm(Tfrm_AccessUserRecordCat, frm_AccessUserRecordCat);
    Application.CreateForm(Tfrm_AccessUserFilingArea, frm_AccessUserFilingArea);
    Application.CreateForm(Tfrm_AccessUserRole, frm_AccessUserRole);
    Application.CreateForm(Tfrm_ContainerComments, frm_ContainerComments);
    Application.CreateForm(TPasswordDlg, PasswordDlg);
    Application.CreateForm(TDatModCap, DatModCap);
    Application.CreateForm(TDatModReq, DatModReq);
    Application.CreateForm(Tfrm_ScanEntries, frm_ScanEntries);
    Application.CreateForm(Tfrm_SelBranch, frm_SelBranch);
    Application.CreateForm(Tfrm_SelDept, frm_SelDept);
    Application.CreateForm(Tfrm_SelWhouse, frm_SelWhouse);
    Application.CreateForm(Tfrm_SelRType, frm_SelRType);
    Application.CreateForm(Tfrm_SelOffsiteContainer, frm_SelOffsiteContainer);
    Application.CreateForm(Tfrm_SelOffSiteBoxDetails, frm_SelOffSiteBoxDetails);
    Application.CreateForm(Tfrm_SelPickDet, frm_SelPickDet);
    Application.CreateForm(Tfrm_DataVer, frm_DataVer);
    Application.CreateForm(Tfrm_RecordLookup, frm_RecordLookup);
    Application.CreateForm(Tfrm_RecCatLookup, frm_RecCatLookup);
    Application.CreateForm(Tfrm_SelFromToDates, frm_SelFromToDates);
    Application.CreateForm(Trep_ContSAtoIA, rep_ContSAtoIA);
    Application.CreateForm(Tfrm_SelBarcode, frm_SelBarcode);
    Application.CreateForm(Tfrm_SelRCat, frm_SelRCat);
    Application.CreateForm(Tfrm_SelRCat, frm_SelRCat);
    Application.CreateForm(Tfrm_SearcheRecordsCross, frm_SearcheRecordsCross);
    Application.CreateForm(Tfrm_SearcheRecords, frm_SearcheRecords);
    Application.CreateForm(Tfrm_ImageAnnote, frm_ImageAnnote);
    Application.CreateForm(Tfrm_GetDate, frm_GetDate);
    Application.CreateForm(Tfrm_RecordComments, frm_RecordComments);
    Application.CreateForm(Tfrm_AddImages, frm_AddImages);
    Application.CreateForm(Tfrm_Progress, frm_Progress);
  finally
    AboutBox.Hide;
    AboutBox.lbl_Reg.Visible := True;
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
    Application.Run;
  end;
end.
