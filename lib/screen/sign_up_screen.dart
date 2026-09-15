import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/core/utils/app_url.dart';
import 'package:flutter_batch16/data/api_response/api_response.dart';
import 'package:flutter_batch16/data/services/api_caller.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailSignTEController = TextEditingController();
  final TextEditingController _firstNameSignTEController =
      TextEditingController();
  final TextEditingController _lastNameSignTEController =
      TextEditingController();
  final TextEditingController _phonNumberSignTEController =
      TextEditingController();
  final TextEditingController _passwordSignTEController =
      TextEditingController();

  String? validator(String? errorMeg, String? value) {
    if (value == null || value.trim().isEmpty) {
      return errorMeg;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBGSVG(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Form(
                key: _signUpGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Join With Us',
                      fSiz: 32,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        TextFormField(
                          controller: _emailSignTEController,
                          validator: (value) =>
                              validator('Input your Valid email', value),
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _firstNameSignTEController,
                          validator: (value) =>
                              validator('Input your First name', value),
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _lastNameSignTEController,
                          validator: (value) =>
                              validator('Input your Last Name', value),
                          decoration: const InputDecoration(
                            labelText: 'Last name',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phonNumberSignTEController,
                          validator: (value) => validator(
                              'Input your 11 dagisel Phone Number', value),
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordSignTEController,
                          validator: (value) =>
                              validator('Input your hard password', value),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => signUpButton(context),
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
                              text: 'Have you an accounts',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = logIn,
                              text: ' logIn?',
                              style: const TextStyle(
                                color: Colors.green,
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
      ),
    );
  }

  Future<void> signUpButton(BuildContext context) async {
    if (_signUpGlobalKey.currentState!.validate()) {
      final Logger logger = Logger();
      final ApiResponse response = await ApiCaller.postRequest(
        AppUrl.register,
        {
          "email": _emailSignTEController.text,
          "firstName": _firstNameSignTEController.text,
          "lastName": _lastNameSignTEController.text,
          "mobile": _phonNumberSignTEController.text,
          "password": _passwordSignTEController.text.trim()
        },
      );
      logger.e(response.responseCode);
      logger.d(response.isSuccess);
      logger.f(response.responseData);
      logger.i(response.errorMessage);

      if (response.isSuccess) {
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.primaryAppColor,
            content: Text('Success  Full SingUp'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed SingUp ${response.responseData} '),
          ),
        );
      }
    } else {
      print('Error ');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed SingUp '),
        ),
      );
    }
  }

  logIn() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }
}
