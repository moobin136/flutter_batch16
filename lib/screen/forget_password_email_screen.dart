import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';
import 'package:flutter_batch16/utils/app_colors.dart';

class ForgetPasswordEmailScreen extends StatefulWidget {
  const ForgetPasswordEmailScreen({super.key});

  @override
  State<ForgetPasswordEmailScreen> createState() =>
      _ForgetPasswordEmailScreenState();
}

class _ForgetPasswordEmailScreenState extends State<ForgetPasswordEmailScreen> {
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
                    text: 'Your Email Address',
                    fSiz: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(
                    width: 340,
                    child: CustomText(
                      maxLines: 2,
                      text:
                          'A 6 digit verification pin will send to your email address',
                      color: AppColors.texGrayColor,
                    ),
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
                      ElevatedButton(
                        onPressed: () {
                          print('login Press');
                          // Navigator.pushReplacementNamed(
                          //     context, AppRoutes.mainNavBarScreen);
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
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = signIn,
                            text: ' Sign in',
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

  signIn() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }
}
