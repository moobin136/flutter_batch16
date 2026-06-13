import 'package:device_preview/device_preview.dart';
import 'package:flutter_batch16/export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.black.withOpacity(0.6),
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.18),
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}
