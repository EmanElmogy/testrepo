@AbapCatalog.sqlViewName: 'ZREQCOMPCDS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Requests and Complaints Comparison CNV'
@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZREQ_C_COMPL as select from ZREQ_I_COMPL {
key reqid,
    @EndUserText.label: 'Year'
    @Consumption.filter:{selectionType: #SINGLE,multipleSelections: false, mandatory: true}
    ZREQ_I_COMPL.c_year as s_year,
    @EndUserText.label: 'Month'
    @AnalyticsDetails.query.axis: #ROWS
      ZREQ_I_COMPL.c_month as s_month,
       
      @AnalyticsDetails.query.axis: #COLUMNS
      @EndUserText.label: 'requests'
  ZREQ_I_COMPL.requests as requests,

      @AnalyticsDetails.query.axis: #COLUMNS
      @EndUserText.label: 'Complaints'
    ZREQ_I_COMPL.complaints as complaints
}
