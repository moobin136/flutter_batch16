import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                      print('login Press');
                      Navigator.pushNamed(
                        context,
                        AppRoutes.mainNavBarScreen,
                      );
                    },
                    child: const CustomText(
                      text: 'Save Profile',
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      print('Log Out');
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loginScreen,
                      );
                    },
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

  Row _imageAndProfileInfo() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Last name',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Mobile',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ],
      ),
    );
  }

  logIn() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }

  onUpdateProfile() {
    CustomSnackBar.show(context: context, message: 'Update Your Profile');
  }
}
