@VDM.viewType: #BASIC

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight'

@ObjectModel.representativeKey: 'FlightDate'
@Analytics.technicalName: 'DS4IFLIGHT'

define view entity Z20_I_FLIGHT
  as select from ds4flight
  association [1] to Z20_I_Airline      as _Airline      on  $projection.AirlineID = _Airline.AirlineID
  association [1] to Z20_I_Connection   as _Connection   on  $projection.AirlineID        = _Connection.AirlineID
                                                         and $projection.ConnectionNumber = _Connection.ConnectionNumber
  association [1] to DS4_I_AirplaneType as _AirplaneType on  $projection.AirplaneType = _AirplaneType.AirplaneType
  association [*] to Z20_I_Booking      as _Bookings     on  $projection.AirlineID        = _Bookings.AirlineID
                                                         and $projection.ConnectionNumber = _Bookings.ConnectionNumber
                                                         and $projection.FlightDate       = _Bookings.FlightDate
  association [1] to I_Currency         as _Currency     on  $projection.CurrencyCode = _Currency.Currency

{

      // Fields
      @ObjectModel.foreignKey.association: '_Airline'
  key carrid     as AirlineID,

      @ObjectModel.foreignKey.association: '_Connection'
  key connid     as ConnectionNumber,

  key fldate     as FlightDate,

      flightguid as FlightGUID,

      @ObjectModel.foreignKey.association: '_AirplaneType'
      planetype  as AirplaneType,

      @Semantics.amount.currencyCode: 'CURRENCYCODE'
      price      as FlightPrice,

      @ObjectModel.foreignKey.association: '_Currency'
      currency   as CurrencyCode,

      // Assocations

      _Airline,
      _Connection,
      _AirplaneType,
      _Currency,
      _Bookings

}
