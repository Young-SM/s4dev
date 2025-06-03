@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z20_C_Customer 
    as projection on DS4_I_Customer
{
    key CustomerGuid,
    CustomerNumber,
    Form,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    CustomerName,
    Street,
    PostCode,
        
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    City,
    Country,
    Email,
    Telephone,
    Discount,
    changed_at,
    /* Associations */
    _Bookings: redirected to composition child Z20_C_Booking
}
