@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Booking'

define view entity Z20_I_BOOKING
  as select from ds4book
  association     to parent Z20_I_CUSTOMER as _Customer     on  $projection.CustomerGuid = _Customer.CustomerGuid
  association [1] to Z20_I_AIRLINE         as _Airline      on  $projection.AirlineID = _Airline.AirlineID
  association [1] to Z20_I_CONNECTION      as _Connection   on  $projection.AirlineID        = _Connection.AirlineID
                                                            and $projection.ConnectionNumber = _Connection.ConnectionNumber
  association [1] to Z20_I_TRAVELAGENCY    as _TravelAgency on  $projection.AgencyNumber = _TravelAgency.AgencyNumber
  association [1] to I_Currency            as _ForeignCurr  on  $projection.ForeignCurrency = _ForeignCurr.Currency

{
      // Fields
  key bookguid   as BookingGuid,

      @ObjectModel.foreignKey.association: '_Airline'
      carrid     as AirlineID,

      @ObjectModel.foreignKey.association: '_Connection'
      connid     as ConnectionNumber,

      fldate     as FlightDate,
      bookid     as BookingNumber,

      @ObjectModel.text.element: ['ClassDescription']
      class      as Class,

      @Semantics.amount.currencyCode: 'ForeignCurrency'
      forcuram   as ForeignCurrencyPayment,

      @ObjectModel.foreignKey.association: '_ForeignCurr'
      forcurkey  as ForeignCurrency,

      order_date as BookingDate,

      @ObjectModel.foreignKey.association: '_TravelAgency'
      agencynum  as AgencyNumber,

      customguid as CustomerGuid,
      cancelled  as IsCancelled,

      // Associations
      _Customer,
      _Airline,
      _Connection,
      _TravelAgency,
      _ForeignCurr
}
