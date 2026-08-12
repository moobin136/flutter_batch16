
import 'package:flutter_batch16/export.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    _emailLoginTEController.clear();
    _passwordLoginTEController.clear();
    super.dispose();
  }

  final GlobalKey<FormState> _gloBalLoginKey = GlobalKey<FormState>();
  final TextEditingController _emailLoginTEController = TextEditingController();
  final TextEditingController _passwordLoginTEController =
      TextEditingController();

  String? validation(String? value, String errorMsg) {
    if (value == null || value.trim().isEmpty) {
      return errorMsg;
    }
    return null;
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
                key: _gloBalLoginKey,
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
                          controller: _emailLoginTEController,
                          validator: (value) =>
                              validation(value, 'Input Email'),
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) =>
                              validation(value, 'Input Password'),
                          controller: _passwordLoginTEController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_gloBalLoginKey.currentState!.validate()) {
                              login();
                              // Navigator.pushReplacementNamed(
                              //     context, AppRoutes.mainNavBarScreen);
                              print('login Press');
                            } else {
                              // null;
                            }
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = signUp,
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
      ),
    );
  }

  login() async {
    final result = await NetworkCaller.postNetwork(AppUrl.login, body: {
      "email": _emailLoginTEController.text.toString(),
      "password": _passwordLoginTEController.text.trim().toString(),
    });
    if (result == true) {
      CustomSnackBar.show(context: context, message: 'Login Success full');
      Navigator.pushReplacementNamed(context, AppRoutes.mainNavBarScreen);
    } else {
      CustomSnackBar.show(
          context: context,
          message: 'status : ${result['status']}\n${result['data']}',
          isError: true);
    }
  }

  signUp() {
    Navigator.pushReplacementNamed(context, AppRoutes.signUpScreen);
  }
}
