import 'package:flutter/material.dart';
import 'package:flutter_batch16/core/utils/unit_enums.dart';
import 'package:flutter_batch16/services/conversion_service.dart';

/// Provider — manages all state for the Unit Converter screen
class ConverterProvider extends ChangeNotifier {
  // ─────────────────────── Category ─────────────────────────────
  ConversionCategory _selectedCategory = ConversionCategory.length;
  ConversionCategory get selectedCategory => _selectedCategory;

  // ─────────────────────── Input ────────────────────────────────
  double _inputValue = 0.0;
  String _inputText = '';
  String get inputText => _inputText;
  bool _hasInput = false;
  bool get hasInput => _hasInput;

  // ─────────────────────── Length ───────────────────────────────
  LengthUnit _fromLength = LengthUnit.kilometer;
  LengthUnit _toLength = LengthUnit.meter;
  LengthUnit get fromLength => _fromLength;
  LengthUnit get toLength => _toLength;

  // ─────────────────────── Weight ───────────────────────────────
  WeightUnit _fromWeight = WeightUnit.kilogram;
  WeightUnit _toWeight = WeightUnit.gram;
  WeightUnit get fromWeight => _fromWeight;
  WeightUnit get toWeight => _toWeight;

  // ──────────────────── Temperature ─────────────────────────────
  TemperatureUnit _fromTemp = TemperatureUnit.celsius;
  TemperatureUnit _toTemp = TemperatureUnit.fahrenheit;
  TemperatureUnit get fromTemp => _fromTemp;
  TemperatureUnit get toTemp => _toTemp;

  // ─────────────────────── Result ───────────────────────────────
  String _result = '0';
  String get result => _result;

  // ──────────────────────── Actions ─────────────────────────────

  void setCategory(ConversionCategory category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _inputText = '';
    _inputValue = 0.0;
    _hasInput = false;
    _result = '0';
    notifyListeners();
  }

  void updateInput(String text) {
    _inputText = text;
    _hasInput = text.isNotEmpty;
    _inputValue = double.tryParse(text) ?? 0.0;
    _calculate();
    notifyListeners();
  }

  void setFromLength(LengthUnit unit) {
    if (_fromLength == unit) return;
    _fromLength = unit;
    _calculate();
    notifyListeners();
  }

  void setToLength(LengthUnit unit) {
    if (_toLength == unit) return;
    _toLength = unit;
    _calculate();
    notifyListeners();
  }

  void setFromWeight(WeightUnit unit) {
    if (_fromWeight == unit) return;
    _fromWeight = unit;
    _calculate();
    notifyListeners();
  }

  void setToWeight(WeightUnit unit) {
    if (_toWeight == unit) return;
    _toWeight = unit;
    _calculate();
    notifyListeners();
  }

  void setFromTemp(TemperatureUnit unit) {
    if (_fromTemp == unit) return;
    _fromTemp = unit;
    _calculate();
    notifyListeners();
  }

  void setToTemp(TemperatureUnit unit) {
    if (_toTemp == unit) return;
    _toTemp = unit;
    _calculate();
    notifyListeners();
  }

  void swapUnits() {
    switch (_selectedCategory) {
      case ConversionCategory.length:
        final temp = _fromLength;
        _fromLength = _toLength;
        _toLength = temp;
      case ConversionCategory.weight:
        final temp = _fromWeight;
        _fromWeight = _toWeight;
        _toWeight = temp;
      case ConversionCategory.temperature:
        final temp = _fromTemp;
        _fromTemp = _toTemp;
        _toTemp = temp;
    }
    _calculate();
    notifyListeners();
  }

  void _calculate() {
    if (!_hasInput) {
      _result = '0';
      return;
    }
    double converted;
    switch (_selectedCategory) {
      case ConversionCategory.length:
        converted = ConversionService.convertLength(_inputValue, _fromLength, _toLength);
      case ConversionCategory.weight:
        converted = ConversionService.convertWeight(_inputValue, _fromWeight, _toWeight);
      case ConversionCategory.temperature:
        converted = ConversionService.convertTemperature(_inputValue, _fromTemp, _toTemp);
    }
    _result = ConversionService.formatResult(converted);
  }

  String get resultSymbol {
    switch (_selectedCategory) {
      case ConversionCategory.length:      return _toLength.symbol;
      case ConversionCategory.weight:      return _toWeight.symbol;
      case ConversionCategory.temperature: return _toTemp.symbol;
    }
  }

  List<LengthUnit> get lengthUnits => LengthUnit.values;
  List<WeightUnit> get weightUnits => WeightUnit.values;
  List<TemperatureUnit> get tempUnits => TemperatureUnit.values;
}
