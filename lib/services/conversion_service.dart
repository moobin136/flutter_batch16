import 'package:flutter_batch16/core/utils/unit_enums.dart';

/// Pure conversion logic — no Flutter dependencies
class ConversionService {
  ConversionService._();

  // ─────────────────────────── LENGTH ───────────────────────────

  static double convertLength(double value, LengthUnit from, LengthUnit to) {
    if (from == to) return value;
    return _fromMeters(_toMeters(value, from), to);
  }

  static double _toMeters(double value, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:       return value;
      case LengthUnit.kilometer:   return value * 1000;
      case LengthUnit.centimeter:  return value / 100;
      case LengthUnit.millimeter:  return value / 1000;
      case LengthUnit.mile:        return value * 1609.344;
      case LengthUnit.yard:        return value * 0.9144;
      case LengthUnit.foot:        return value * 0.3048;
      case LengthUnit.inch:        return value * 0.0254;
    }
  }

  static double _fromMeters(double meters, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:       return meters;
      case LengthUnit.kilometer:   return meters / 1000;
      case LengthUnit.centimeter:  return meters * 100;
      case LengthUnit.millimeter:  return meters * 1000;
      case LengthUnit.mile:        return meters / 1609.344;
      case LengthUnit.yard:        return meters / 0.9144;
      case LengthUnit.foot:        return meters / 0.3048;
      case LengthUnit.inch:        return meters / 0.0254;
    }
  }

  // ─────────────────────────── WEIGHT ───────────────────────────

  static double convertWeight(double value, WeightUnit from, WeightUnit to) {
    if (from == to) return value;
    return _fromGrams(_toGrams(value, from), to);
  }

  static double _toGrams(double value, WeightUnit unit) {
    switch (unit) {
      case WeightUnit.gram:        return value;
      case WeightUnit.kilogram:    return value * 1000;
      case WeightUnit.milligram:   return value / 1000;
      case WeightUnit.pound:       return value * 453.592;
      case WeightUnit.ounce:       return value * 28.3495;
      case WeightUnit.ton:         return value * 1000000;
    }
  }

  static double _fromGrams(double grams, WeightUnit unit) {
    switch (unit) {
      case WeightUnit.gram:        return grams;
      case WeightUnit.kilogram:    return grams / 1000;
      case WeightUnit.milligram:   return grams * 1000;
      case WeightUnit.pound:       return grams / 453.592;
      case WeightUnit.ounce:       return grams / 28.3495;
      case WeightUnit.ton:         return grams / 1000000;
    }
  }

  // ─────────────────────── TEMPERATURE ──────────────────────────

  static double convertTemperature(
    double value,
    TemperatureUnit from,
    TemperatureUnit to,
  ) {
    if (from == to) return value;
    return _fromCelsius(_toCelsius(value, from), to);
  }

  static double _toCelsius(double value, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:     return value;
      case TemperatureUnit.fahrenheit:  return (value - 32) * 5 / 9;
      case TemperatureUnit.kelvin:      return value - 273.15;
    }
  }

  static double _fromCelsius(double celsius, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:     return celsius;
      case TemperatureUnit.fahrenheit:  return (celsius * 9 / 5) + 32;
      case TemperatureUnit.kelvin:      return celsius + 273.15;
    }
  }

  // ──────────────────────── FORMAT ──────────────────────────────

  static String formatResult(double value) {
    if (value == value.truncateToDouble()) {
      return value.toStringAsFixed(0);
    }
    String result = value.toStringAsFixed(6);
    result = result.replaceAll(RegExp(r'0+$'), '');
    result = result.replaceAll(RegExp(r'\.$'), '');
    return result;
  }
}
