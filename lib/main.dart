import 'package:device_preview/device_preview.dart';

export 'app/app.dart';
import 'export.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}
