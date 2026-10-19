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
                  _buildForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
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
          _addTask(context),
        ],
      ),
    );
  }

  Widget _addTask(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          await AuthController.getData();

          final ApiResponse response = await ApiCaller.postRequest(
            AppUrl.createTask,
            {
              "title": _titleController.text.trim(),
              "description": _descriptionController.text.trim(),
              "status": "New",
            },
            token: AuthController.token,
          );

          if (!context.mounted) return;

          // Response Success কি না চেক করুন
          if (response.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Task added successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(
                context, AppRoutes.mainNavBarScreen);
          } else {
            // UnAuthorized (401) হলে লগইন পেজে রিডাইরেক্ট অথবা মেসেজ দেখানো
            if (response.responseCode == 401) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Session Expired! Please login again.'),
                  backgroundColor: Colors.red,
                ),
              );
              // টোকেন ক্লিয়ার করে লগইন পেজে পাঠিয়ে দিন
              await AuthController.clearTokenAndData();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginScreen,
                    (route) => false,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed: ${response.errorMessage ?? "Something went wrong"}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
      },
      child: const Icon(
        Icons.add,
        size: 20,
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
