@VDM.viewType:  #BASIC

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airplane Type'
@ObjectModel.representativeKey: 'AirplaneType'
@Analytics.technicalName: 'Z20IAPLANE'

define view entity Z20_I_AIRPLANETYPE
  as select from saplane
{
  key planetype                          as AirplaneType,

      producer                           as Manufacturer,

      seatsmax                           as SeatsEconomy,

      seatsmax_b                         as SeatsBusiness,

      seatsmax_f                         as SeatsFirst,

      seatsmax + seatsmax_b + seatsmax_f as SeatsTotal,

      @Semantics.quantity.unitOfMeasure: 'ConsumptionUnit'
      consum                             as AverageConsumption,
      con_unit                           as ConsumptionUnit,

      @Semantics.quantity.unitOfMeasure: 'LengthUnit'
      leng                               as OverallLength,
      leng_unit                          as LengthUnit,

      @Semantics.quantity.unitOfMeasure: 'SpanUnit'
      span                               as WingSpan,
      span_unit                          as SpanUnit,

      @Semantics.quantity.unitOfMeasure: 'SpeedUnit'
      op_speed                           as OperatingSpeed,
      speed_unit                         as SPeedUnit,

      @Semantics.quantity.unitOfMeasure: 'CapacityUnit'
      tankcap                            as TankCapacity,
      cap_unit                           as CapacityUnit,

      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      weight                             as OverallWeight,
      wei_unit                           as WeightUnit

}
