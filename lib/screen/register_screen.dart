import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/core/constan/image_svg_icon_path.dart';
import 'package:flutter_batch16/core/global_widgets/cm_button.dart';
import 'package:flutter_batch16/core/global_widgets/cm_text_field.dart';
import 'package:flutter_batch16/core/global_widgets/icon_text_button.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _isObscured = true;
  bool _isObscuredRe = true;

  String? validateField(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                buildForm(),
                button(),
                const SizedBox(height: 20),
                richTextSignIn(),
                const Align(
                  alignment: Alignment.center,
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
                iconWithButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CmTextField(
            validator: (String? value) =>
                validateField(value, 'Enter mobile number'),
            controller: _phoneNumberController,
            titleText: 'Enter your mobile number',
            hintText: '+8801************',
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _phoneNumberController.text.isNotEmpty;
                  setState(() {});
                });
              },
              child: Icon(
                _phoneNumberController.text.isNotEmpty
                    ? Icons.verified_outlined
                    : Icons.error_outline,
              ),
            ),
          ),
          CmTextField(
            validator: (value) => validateField(value, 'Enter your email'),
            controller: _emailController,
            titleText: 'Enter your email',
            hintText: 'example@email.com',
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                _emailController.text.isNotEmpty
                    ? Icons.verified_outlined
                    : Icons.error_outline,
              ),
            ),
          ),
          CmTextField(
            validator: (value) => validateField(value, 'Enter your password'),
            controller: _passwordController,
            titleText: 'Enter your password',
            hintText: '**********',
            obscureText: _isObscuredRe,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscuredRe = !_isObscuredRe;
                });
              },
              child: Icon(
                _isObscuredRe
                    ? Icons.visibility
                    : Icons.visibility_off_outlined,
              ),
            ),
          ),
          CmTextField(
            validator: (value) =>
                validateField(value, 'Enter your re-enter password'),
            controller: _confirmPasswordController,
            obscureText: _isObscured,
            titleText: 'Re-enter your password',
            hintText: '**********',
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              child: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off_outlined,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget button() {
    return CmButton(
      onTap: onTapRegister,
      labelText: 'Register',
    );
  }

  Widget richTextSignIn() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? Sig in',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: ' Sign in',
              recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
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

  void onTapRegister() {
    if (_globalKey.currentState!.validate()) {
      if (kDebugMode) {
        print('Form is valid!');
        print('Phone Number: ${_phoneNumberController.text}');
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');
        print('Confirm Password: ${_confirmPasswordController.text}');
      }
    }
  }

  void onTapSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  void onTapGoogle() {
    if (kDebugMode) {
      print("Google In button tapped!");
    }
  }

  void onTapApple() {
    if (kDebugMode) {
      print("Apple In button tapped!");
    }
  }
}
