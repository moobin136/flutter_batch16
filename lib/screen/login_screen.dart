import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/core/global_widgets/cm_button.dart';
import 'package:flutter_batch16/core/global_widgets/cm_text_field.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/screen/home_screen.dart';

import '../core/constan/image_svg_icon_path.dart';
import '../core/global_widgets/icon_text_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController loginEmailTEController = TextEditingController();
  final TextEditingController loginPasswordTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKye,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    CmTextField(
                      titleText: 'Enter your Register email',
                      hintText: 'example@mail.com',
                      controller: loginEmailTEController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        String emailPattern =
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        if (!RegExp(emailPattern).hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    CmTextField(
                      titleText: 'Enter your Password',
                      hintText: '******',
                      controller: loginPasswordTEController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your password';
                        }

                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters long';
                        }

                        String pattern =
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]';
                        RegExp regExp = RegExp(pattern);

                        if (!regExp.hasMatch(value.trim())) {
                          return 'Password must contain uppercase, lowercase, number and special character';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),


                    CmButton(
                      labelText: 'Log In',
                      onTap: () {
                        if (_formKye.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    richTextSignIn(),
                    const SizedBox(height: 8),

                    // 'or' টেক্সটটিকে সুন্দরভাবে সেন্টারে দেখানোর জন্য Row পরিবর্তন করা হয়েছে
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    iconWithButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateField(
      String? value, String errorMessage, TextEditingController? controller) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  Widget richTextSignIn() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'You have an account? ',
          // এখানে চাইলে 'Don\'t have an account?' দিতে পারেন
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: ' Register',
              recognizer: TapGestureRecognizer()..onTap = onTapRegister,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconWithButton() {
    return Column(
      children: [
        CmIconTextButton(
          onTap: onTapGoogle,
          imagePath: ImageSvgIconPath.google,
          labelText: 'Continue with Google',
        ),
        const SizedBox(height: 16),
        CmIconTextButton(
          onTap: onTapApple,
          imagePath: ImageSvgIconPath.apple,
          labelText: 'Continue with Apple',
        ),
      ],
    );
  }

  void onTapGoogle() {
    if (kDebugMode) {
      print('onTap Google');
    }
  }

  void onTapApple() {
    if (kDebugMode) {
      print('onTap Apple');
    }
  }

  void onTapRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }
}
