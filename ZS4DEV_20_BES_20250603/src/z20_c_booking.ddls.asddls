@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking Projection View'
@Metadata.allowExtensions: true
define view entity Z20_C_Booking 
    as projection on DS4_I_Booking
{
    key BookingGuid,
    AirlineID,
    ConnectionNumber,
    FlightDate,
    BookingNumber,
    Class,
    ForeignCurrencyPayment,
    ForeignCurrency,
    BookingDate,
    AgencyNumber,
    CustomerGuid,
    IsCancelled,
    /* Associations */
    _Customer: redirected to parent Z20_C_Customer
}
