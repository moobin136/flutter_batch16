import 'package:flutter_batch16/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Logger logger = Logger();

  Future<void> _moveToNextScreen() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        AuthController.getData();
        bool isLogin = await AuthController.isUserLogin();
        logger.i('Auth has code : ${(AuthController.getData().hashCode)}');
        logger.i('Auth has code : ${(AuthController.getData().hashCode)}');
        Navigator.pushReplacementNamed(
          context,
          isLogin ? AppRoutes.mainNavBarScreen : AppRoutes.loginScreen,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomBGSVG(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  height: 65,
                  width: 65,
                  AssetsPath.logo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
