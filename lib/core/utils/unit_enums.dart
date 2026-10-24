/// Supported conversion categories
enum ConversionCategory {
  length,
  weight,
  temperature,
}

/// Supported units for Length
enum LengthUnit { meter, kilometer, centimeter, millimeter, mile, yard, foot, inch }

/// Supported units for Weight
enum WeightUnit { gram, kilogram, milligram, pound, ounce, ton }

/// Supported units for Temperature
enum TemperatureUnit { celsius, fahrenheit, kelvin }

// ─────────────────────── Extensions ───────────────────────────

extension LengthUnitExt on LengthUnit {
  String get displayName {
    switch (this) {
      case LengthUnit.meter:        return 'Meter';
      case LengthUnit.kilometer:    return 'Kilometer';
      case LengthUnit.centimeter:   return 'Centimeter';
      case LengthUnit.millimeter:   return 'Millimeter';
      case LengthUnit.mile:         return 'Mile';
      case LengthUnit.yard:         return 'Yard';
      case LengthUnit.foot:         return 'Foot';
      case LengthUnit.inch:         return 'Inch';
    }
  }

  String get symbol {
    switch (this) {
      case LengthUnit.meter:        return 'm';
      case LengthUnit.kilometer:    return 'km';
      case LengthUnit.centimeter:   return 'cm';
      case LengthUnit.millimeter:   return 'mm';
      case LengthUnit.mile:         return 'mi';
      case LengthUnit.yard:         return 'yd';
      case LengthUnit.foot:         return 'ft';
      case LengthUnit.inch:         return 'in';
    }
  }
}

extension WeightUnitExt on WeightUnit {
  String get displayName {
    switch (this) {
      case WeightUnit.gram:         return 'Gram';
      case WeightUnit.kilogram:     return 'Kilogram';
      case WeightUnit.milligram:    return 'Milligram';
      case WeightUnit.pound:        return 'Pound';
      case WeightUnit.ounce:        return 'Ounce';
      case WeightUnit.ton:          return 'Ton';
    }
  }

  String get symbol {
    switch (this) {
      case WeightUnit.gram:         return 'g';
      case WeightUnit.kilogram:     return 'kg';
      case WeightUnit.milligram:    return 'mg';
      case WeightUnit.pound:        return 'lb';
      case WeightUnit.ounce:        return 'oz';
      case WeightUnit.ton:          return 't';
    }
  }
}

extension TemperatureUnitExt on TemperatureUnit {
  String get displayName {
    switch (this) {
      case TemperatureUnit.celsius:     return 'Celsius';
      case TemperatureUnit.fahrenheit:  return 'Fahrenheit';
      case TemperatureUnit.kelvin:      return 'Kelvin';
    }
  }

  String get symbol {
    switch (this) {
      case TemperatureUnit.celsius:     return '°C';
      case TemperatureUnit.fahrenheit:  return '°F';
      case TemperatureUnit.kelvin:      return 'K';
    }
  }
}
