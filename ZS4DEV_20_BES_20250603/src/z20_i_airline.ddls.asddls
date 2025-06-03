@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airline'

@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'AirlineID'
@Analytics.technicalName: 'DS4IAIRL'

define view entity Z20_I_AIRLINE
  as select from scarr
  association [1] to I_Currency as _Currency on $projection.LocalCurrency = _Currency.Currency

{

  key carrid   as AirlineID,

      carrname as AirlineName,

      @ObjectModel.foreignKey.association: '_Currency'
      currcode as LocalCurrency,

      url      as WebAdress,

      _Currency
}
