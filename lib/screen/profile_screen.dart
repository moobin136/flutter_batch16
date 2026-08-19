import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/utils/validator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phonNumberTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
                  _imageAndProfileInfo(),
                  const SizedBox(height: 16),
                  _buildForm(context),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      print('Save Press');
                      if (_globalKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.mainNavBarScreen,
                        );
                      } else {
                        CustomSnackBar.show(
                          context: context,
                          message: 'Update Your Profile',
                          isError: true,
                        );

                        //ABCD@GAMIL.COM
                      }
                    },
                    child: const CustomText(
                      text: 'Save Profile',
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: logOut,
                    child: const CustomText(
                      text: 'Log Out',
                      color: AppColors.white,
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

  Widget _imageAndProfileInfo() {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            // image: ,
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: const Center(
            child: Icon(
              Icons.person_4,
              size: 80,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Md Mozahedul Islam Mobin',
              fSiz: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 3),
            CustomText(
              text: 'moobinislam3@gmail.com',
              fSiz: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) =>
                Validator.validator('Input your New Email', value),
            controller: _emailTEController,
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: (value) =>
                Validator.validator('Input New F Name', value),
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: (value) =>
                Validator.validator('Input New L Name', value),
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              labelText: 'Last name',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: (value) =>
                Validator.validator('Input New Valid Phn Num', value),
            controller: _phonNumberTEController,
            decoration: const InputDecoration(
              labelText: 'Mobile',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: (value) => Validator.validator('Strong Password', value),
            controller: _passwordTEController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logOut() async {

    await AuthController.clearAuthData();

    print('Clear হওয়ার পর Email: ${AuthController.email}');
    print('Clear হওয়ার পর Token: ${AuthController.token}');

    // ২. লগইন স্ক্রিনে নিয়ে যাওয়া এবং আগের সব রুট নেভিগেশন হিস্ট্রি মুছে ফেলা
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.loginScreen,
        (route) => false,
      );
    }
  }

  onUpdateProfile() {
    CustomSnackBar.show(context: context, message: 'Update Your Profile');
  }
}
