@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition - Flights'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true -- Enable Metadata Extensions for this view entity
define view entity zdd_02_flight_associations_365
  as select from /dmo/flight as FlightsSchedule
  //  association [0..*] to /dmo/carrier as _Airline on _Airline.carrier_id = FlightsSchedule.carrier_id
  association [0..*] to /dmo/carrier as _Airline on _Airline.carrier_id = $projection.CarrierId
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
      _Airline.name  as Airline,
      _Airline
}
