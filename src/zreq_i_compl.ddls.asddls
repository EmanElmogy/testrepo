@AbapCatalog.sqlViewName: 'ZREQCOM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Requests and Complaints Comparison CV'
@VDM.viewType:#COMPOSITE
@Analytics.dataExtraction.enabled: false
@Analytics.dataCategory: #CUBE

define view ZREQ_I_COMPL as select from ZREQ_I_COMP{
    
   key ZREQ_I_COMP.reqid,
       ZREQ_I_COMP.c_year,
       ZREQ_I_COMP.c_month,
       @DefaultAggregation:#SUM
       ZREQ_I_COMP.requests,
       @DefaultAggregation:#SUM
       ZREQ_I_COMP.complaints
} 
  
  
  
