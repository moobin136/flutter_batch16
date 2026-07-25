import 'package:flutter/gestures.dart';
import 'package:flutter_batch16/export.dart';
import 'package:flutter_batch16/routes.dart';
import 'package:flutter_batch16/utils/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
                    text: 'Add New Task',
                    fSiz: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Subject',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.start,
                        // textAlignVertical: TextAlignVertical.top,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          hintText: 'Enter your description',
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          print('login Press');
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.mainNavBarScreen);
                        },
                        child: const Icon(
                          Icons.login,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
