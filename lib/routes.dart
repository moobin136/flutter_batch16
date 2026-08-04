



import 'export.dart';

class AppRoutes {
  static const String initialRoute = '/';


  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialRoute: (context) => const SplashScreen(),

    };
  }
}
