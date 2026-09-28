import 'package:flutter_batch16/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                              loginButton();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: CustomText(
                                    text: 'Error',
                                    color: Colors.black,
                                  ),
                                ),
                              );
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

  Future<void> loginButton() async {
    final Logger logger = Logger();

    // API Call
    final ApiResponse response = await ApiCaller.postRequest(
      AppUrl.login,
      {
        "email": _emailLoginTEController.text.trim(),
        "password": _passwordLoginTEController.text.trim(),
      },
    );

    // Debug log
    logger.i('================ LOGIN RESPONSE ================');
    logger.i('Success : ${response.isSuccess}');
    logger.i('Code    : ${response.responseCode}');
    logger.i('Data    : ${response.responseData}');
    logger.i('Error   : ${response.errorMessage}');
    logger.i('==================================================');

    // Screen এখনো active আছে কিনা
    if (!mounted) return;

    // ============================================================
    // SUCCESS
    // ============================================================

    if (response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData["data"]);
      String token = (response.responseData["token"]);

      AuthController.saveData(model, token);

      logger.i('Auth has code : ${(AuthController.getData().hashCode)}');

      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner(reason: MaterialBannerClosedReason.hide)
        ..showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.primaryAppColor,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            content: CustomText(
              text: 'Login Successfully',
              color: Colors.white,
            ),
          ),
        );

      // ScaffoldMessenger.of(context).showMaterialBanner(
      //   MaterialBanner(
      //     surfaceTintColor: Colors.amber,
      //     content: Text('Product added successfully'),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: Text('OK'),
      //       ),
      //     ],
      //   ),
      // );
      // SnackBar দেখানোর জন্য একটু সময়
      await Future.delayed(
        const Duration(milliseconds: 200),
      );

      if (!mounted) return;

      // Main Screen
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.mainNavBarScreen,
      );

      return;
    }

    // ============================================================
    // ERROR
    // ============================================================

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          content: CustomText(
            text: response.responseCode.toString(),
            color: Colors.white,
          ),
        ),
      );
  }

  signUp() {
    Navigator.pushReplacementNamed(context, AppRoutes.signUpScreen);
  }
}
