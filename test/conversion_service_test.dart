import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_batch16/core/utils/unit_enums.dart';
import 'package:flutter_batch16/services/conversion_service.dart';

void main() {
  group('Unit Converter - ConversionService Tests', () {
    test('Length: 10 Kilometer = 10000 Meter (Assignment Example)', () {
      final result = ConversionService.convertLength(
        10,
        LengthUnit.kilometer,
        LengthUnit.meter,
      );
      expect(result, 10000);
      expect(ConversionService.formatResult(result), '10000');
    });

    test('Length: 10000 Meter = 10 Kilometer', () {
      final result = ConversionService.convertLength(
        10000,
        LengthUnit.meter,
        LengthUnit.kilometer,
      );
      expect(result, 10);
      expect(ConversionService.formatResult(result), '10');
    });

    test('Weight: 5 Kilogram = 5000 Gram', () {
      final result = ConversionService.convertWeight(
        5,
        WeightUnit.kilogram,
        WeightUnit.gram,
      );
      expect(result, 5000);
      expect(ConversionService.formatResult(result), '5000');
    });

    test('Weight: 2500 Gram = 2.5 Kilogram', () {
      final result = ConversionService.convertWeight(
        2500,
        WeightUnit.gram,
        WeightUnit.kilogram,
      );
      expect(result, 2.5);
      expect(ConversionService.formatResult(result), '2.5');
    });

    test('Temperature: 0 Celsius = 32 Fahrenheit', () {
      final result = ConversionService.convertTemperature(
        0,
        TemperatureUnit.celsius,
        TemperatureUnit.fahrenheit,
      );
      expect(result, 32);
      expect(ConversionService.formatResult(result), '32');
    });

    test('Temperature: 212 Fahrenheit = 100 Celsius', () {
      final result = ConversionService.convertTemperature(
        212,
        TemperatureUnit.fahrenheit,
        TemperatureUnit.celsius,
      );
      expect(result, 100);
      expect(ConversionService.formatResult(result), '100');
    });
  });
}
