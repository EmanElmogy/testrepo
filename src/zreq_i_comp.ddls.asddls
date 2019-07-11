@AbapCatalog.sqlViewName: 'ZREQCOMPLAIN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Requests and Complaints Comparison BV'
@VDM.viewType:#BASIC
define view ZREQ_I_COMP
  as select from /cicre/csreq
{

  key reqid,
  substring(created_date,1,4) as c_year,
  substring(created_date,5,2) as c_month,
     @DefaultAggregation:#SUM
  case req_type
  when '0010' then 1
  else  0
  end                         as requests,
     @DefaultAggregation:#SUM
  case req_type
  when '0011' then 1
  else 0
  end                         as complaints
} 
  
