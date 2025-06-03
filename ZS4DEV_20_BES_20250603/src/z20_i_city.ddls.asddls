@VDM.viewType: #BASIC

@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.representativeKey: 'City'
@Analytics.technicalName: 'Z204ICITY'

@Search.searchable: true

@EndUserText.label: 'City'
define view entity Z20_I_CITY
  as select from sgeocity
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.address.city: true
  key city      as City,

      @Semantics.address.country: true
  key country   as Country,

      @Semantics.geoLocation.latitude: true
      latitude  as Latitude,

      @Semantics.geoLocation.longitude: true
      longitude as Longitude

}
