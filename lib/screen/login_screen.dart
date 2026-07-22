import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';
import 'package:flutter_batch16/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBGSVG(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Get Started With',
                    fSiz: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          print('login Press');
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.mainNavBarScreen);
                        },
                        child: const Icon(
                          Icons.login,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: TextButton(
                      onPressed: () {
                        print('password Forgot');
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgetPasswordEmailScreen,
                        );
                      },
                      child: const CustomText(
                        text: 'Forget Password ?',
                        color: AppColors.texGrayColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Don\'t have account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = signUp,
                            text: ' Sign up',
                            style: const TextStyle(
                              color: AppColors.primaryAppColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    Navigator.pushReplacementNamed(context, AppRoutes.signUpScreen);
  }
}
