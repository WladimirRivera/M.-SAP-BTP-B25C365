@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition - Flights'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDD_01_FLIGHTS_365
  as select from /dmo/flight as FlightsSchedule

{
  key carrier_id    as CarrierId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(price)    as SumPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      min(price)    as MinPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      max(price)    as MaxPrice,
      currency_code as CurrencyCode
}
group by
  carrier_id,
  currency_code;
