import 'package:flutter_batch16/export.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          validator: (value) => validator(
                            value,
                            'Input your Title',
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Subject',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionController,
                          validator: (value) => validator(
                            value,
                            'Input your description',
                          ),
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
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.mainNavBarScreen);
                              print('login Press');
                            } else {
                              print(null);
                              null;
                            }
                          },
                          child: const Icon(
                            Icons.login,
                            size: 20,
                          ),
                        ),
                      ],
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

  String? validator(String? value, String error) {
    if (value!.isEmpty) {
      return 'Input your $error';
    } else {
      return null;
    }
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryAppColor,
    title: const CustomText(
      text: 'Add New Task',
      color: Colors.white,
      fSiz: 22,
    ),
  );
}
