import 'package:flutter/foundation.dart';
import 'package:flutter_batch16/export.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    _firstNameSignTEController.clear();
    _lastNameSignTEController.clear();
    _emailSignTEController.clear();
    _passwordSignTEController.clear();
    _phonNumberSignTEController.clear();
    super.dispose();
  }

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
              child: _buildForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
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
                validator: (value) => validator('Input your First name', value),
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameSignTEController,
                validator: (value) => validator('Input your Last Name', value),
                decoration: const InputDecoration(
                  labelText: 'Last name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phonNumberSignTEController,
                validator: (value) =>
                    validator('Input your 11 dagisel Phone Number', value),
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
              _singUpButton(),
            ],
          ),
          const SizedBox(height: 32),
          _lastPartLogIn(),
        ],
      ),
    );
  }

  Widget _singUpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_signUpGlobalKey.currentState!.validate()) {
          singUp();
          // Navigator.pushReplacementNamed(
          //     context, AppRoutes.loginScreen);
          if (kDebugMode) {
            print('login Press');
          }
        } else {
          if (kDebugMode) {
            print('Error ');
          }
        }
      },
      child: const Icon(
        Icons.login,
        size: 20,
      ),
    );
  }

  Widget _lastPartLogIn() {
    return Align(
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
    );
  }

  logIn() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }

  singUp() async {
    final result = await NetworkCaller.postNetwork(AppUrl.registration, body: {
      "email": _emailSignTEController.text.toString(),
      "firstName": _firstNameSignTEController.text.toString(),
      "lastName": _lastNameSignTEController.text.toString(),
      "mobile": _phonNumberSignTEController.text.toString(),
      "password": _passwordSignTEController.text.trim().toString(),
    });

    if (result == true) {
      CustomSnackBar.show(
        context: context,
        message: 'Registration Successful ',
      );
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    } else {
      CustomSnackBar.show(
        context: context,
        message: 'status : ${result['status']}\n${result['data']}',
        isError: true,
      );
    }
  }
}
