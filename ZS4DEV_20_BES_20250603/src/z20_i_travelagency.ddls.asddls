@VDM.viewType: #BASIC

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Agency'

@ObjectModel.representativeKey: 'AgencyNumber'
@Analytics.technicalName: 'Z20ITRAVELAG'

define view entity Z20_I_TRAVELAGENCY
  as select from stravelag
  association [1] to Z20_I_CITY as _City     on  $projection.City    = _City.City
                                             and $projection.Country = _City.Country
  association [1] to I_Currency as _Currency on  $projection.LocalCurrency = _Currency.Currency
  association [1] to I_Language as _Language on  $projection.PreferredLanguage = _Language.Language
{
      // Fields
  key agencynum as AgencyNumber,

      name      as AgencyName,

      street    as Street,

      postbox   as PostBox,

      postcode  as PostCode,

      @ObjectModel.foreignKey.association: '_City'
      city      as City,

      region    as Region,

      @ObjectModel.foreignKey.association: '_City'
      country   as Country,

      @ObjectModel.foreignKey.association: '_Currency'
      currency  as LocalCurrency,

      @ObjectModel.foreignKey.association: '_Language'
      langu     as PreferredLanguage,

      telephone as PhoneNumber,

      url       as WebAddress,

      // Associations
      _City,
      _Currency,
      _Language
}
