import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.loginScreen,
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
            SizedBox(width: 10),
            Text(
              'TaskManager',
              style: TextStyle(
                fontSize: size.height * 0.038,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            // CustomText(
            //   text: 'TaskManager',
            //   fSiz: ,
            //   fontWeight: FontWeight.w800,
            // )
          ],
        ),
      ),
    );
  }
}
