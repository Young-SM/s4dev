@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Customer'


define root view entity Z20_I_CUSTOMER
  as select from ds4custom
  composition [*] of Z20_I_Booking as _Bookings
  association [1] to Z20_I_City    as _City on  $projection.City    = _City.City
                                            and $projection.Country = _City.Country
{

      // Fields
  key customguid as CustomerGuid,

      @ObjectModel.text.element: ['CustomerFullName']
      id         as CustomerNumber,

      @Semantics.name.prefix: true
      form       as Form,

      @Semantics.name.fullName: true
      name       as CustomerName,

      @Semantics.address.street: true
      street     as Street,

      @Semantics.address.zipCode: true
      postcode   as PostCode,

      @Semantics.address.city: true
      @ObjectModel.foreignKey.association: '_City'
      city       as City,

      @Semantics.address.country: true
      @ObjectModel.foreignKey.association: '_City'
      country    as Country,

      @Semantics.eMail.address: true
      email      as Email,

      @Semantics.telephone.type:  [ #PREF ]
      telephone  as Telephone,

      discount   as Discount,

      @Semantics.systemTime.lastChangedAt: true
      changed_at as changed_at,

      // Associations
      _Bookings,
      _City
}
