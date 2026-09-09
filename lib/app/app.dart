import 'package:device_preview/device_preview.dart';

import '../export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: '/product-list',
      routes: {
        '/product-list': (context) => const ProductListScreen(),
        '/product-add': (context) => const AddProductScreen(),
        // '/product-edit': (context) => const EditProductScreen(product: null,),
        
      },
    );
  }
}
