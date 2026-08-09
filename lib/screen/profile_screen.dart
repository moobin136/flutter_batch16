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
                  Row(
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
                          )
                        ],
                      )
                    ],
                  ),
                  // const CustomText(
                  //   text: 'Update Profile',
                  //   fSiz: 32,
                  //   fontWeight: FontWeight.w700,
                  // ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     // Flexible(
                      //     //   flex: 1,
                      //     //   child: Container(
                      //     //     // height: 60,
                      //     //     decoration: const BoxDecoration(
                      //     //       color: AppColors.profileContainerColor,
                      //     //       borderRadius: BorderRadius.only(
                      //     //         topLeft: Radius.circular(7),
                      //     //         bottomLeft: Radius.circular(7),
                      //     //       ),
                      //     //     ),
                      //     //     child: const Padding(
                      //     //       padding: EdgeInsets.symmetric(
                      //     //           vertical: 18, horizontal: 10),
                      //     //       child: Center(
                      //     //         child: CustomText(
                      //     //           text: 'Photo',
                      //     //           color: Colors.white,
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     // Flexible(
                      //     //   flex: 3,
                      //     //   child: Container(
                      //     //     // height: 60,
                      //     //     decoration: const BoxDecoration(
                      //     //       color: Colors.white70,
                      //     //       borderRadius: BorderRadius.only(
                      //     //         topRight: Radius.circular(7),
                      //     //         bottomRight: Radius.circular(7),
                      //     //       ),
                      //     //     ),
                      //     //     child: const Padding(
                      //     //       padding: EdgeInsets.symmetric(
                      //     //           vertical: 18, horizontal: 10),
                      //     //       child: Center(
                      //     //         child: CustomText(
                      //     //           text: '',
                      //     //           color: Colors.white,
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // )
                      //   ],
                      // ),
                      // const SizedBox(height: 16),
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
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          print('login Press');
                          Navigator.pushNamed(
                            context,
                            AppRoutes.mainNavBarScreen,
                          );
                        },
                        child: const Icon(
                          Icons.login,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  logIn() {
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
  }
}
