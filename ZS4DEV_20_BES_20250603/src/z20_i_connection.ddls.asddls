@VDM.viewType: #BASIC

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Connection'
@ObjectModel.representativeKey: 'ConnectionNumber'
@Analytics.technicalName: 'DS4ICONN'

define view entity Z20_I_CONNECTION
  as select from spfli
  association [1] to Z20_I_AIRLINE as _Airline    on  $projection.AirlineID = _Airline.AirlineID
  association [*] to Z20_I_Flight  as _Flights    on  $projection.AirlineID        = _Flights.AirlineID
                                                  and $projection.ConnectionNumber = _Flights.ConnectionNumber
  association [1] to Z20_I_City    as _OriginCity on  $projection.OriginCity    = _OriginCity.City
                                                  and $projection.OriginCountry = _OriginCity.Country
  association [1] to Z20_I_City    as _DestinCity on  $projection.DestinationCity   = _DestinCity.City
                                                  and $projection.DestinationCoutry = _DestinCity.Country

{

      // Fields
      @ObjectModel.foreignKey.association: '_Airline'
  key carrid    as AirlineID,

  key connid    as ConnectionNumber,

      fltype    as FlightType,

      airpfrom  as OriginAirport,

      @ObjectModel.foreignKey.association: '_OriginCity'
      cityfrom  as OriginCity,
      countryfr as OriginCountry,


      airpto    as DestinationAirport,

      @ObjectModel.foreignKey.association: '_DestinCity'
      cityto    as DestinationCity,
      countryto as DestinationCoutry,

      @Semantics.quantity.unitOfMeasure: 'UnitForDistance'
      distance  as FlightDistance,
      distid    as UnitForDistance,

      deptime   as DepartureTime,
      arrtime   as ArrivalTime,

      period    as ArrivalDaysLater,
      fltime    as FlightDuration,

      // Associations

      _Airline,
      _Flights,
      _OriginCity,
      _DestinCity

}
