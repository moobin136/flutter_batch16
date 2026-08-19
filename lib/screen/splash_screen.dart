import 'package:flutter_batch16/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await AuthController.isLoggedIn();

    print('Email: ${AuthController.email}');
    print('Token: ${AuthController.token}');

    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? AppRoutes.mainNavBarScreen : AppRoutes.loginScreen,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomBGSVG(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task,
              size: size.height * 0.068,
              color: AppColors.primaryAppColor,
            ),
            const SizedBox(width: 10),
            Text(
              'TaskManager',
              style: TextStyle(
                fontSize: size.height * 0.038,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
