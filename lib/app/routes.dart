import 'package:flutter/material.dart';
import 'package:flutter_batch16/views/screens/unit_converter/unit_converter_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String unitConverterScreen = '/unitConverterScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialRoute: (context) => const UnitConverterScreen(),
      unitConverterScreen: (context) => const UnitConverterScreen(),
    };
  }
}
