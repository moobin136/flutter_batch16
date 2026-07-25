

import 'export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String mainNavBarScreen = '/mainNavBarScreen';
  static const String completedTaskScreen = '/completedTaskScreen';
  static const String cancelTaskScreen = '/cancelTaskScreen';
  static const String newTaskScreen = '/newTaskScreen';
  static const String progressTaskScreen = '/progressTaskScreen';
  static const String forgetPasswordEmailScreen = '/forgetPasswordEmailScreen';
  static const String inputOTPScreen = '/InputOTPScreen';

  static const String setNewPasswordScreen = '/setNewPasswordScreen';
  static const String profileScreen = '/profileScreen';
  static const String addTaskScreen = '/addTaskScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialRoute: (context) => const SplashScreen(),
      loginScreen: (context) => const LoginScreen(),
      signUpScreen: (context) => const SignUpScreen(),
      mainNavBarScreen: (context) => const MainNavBarScreen(),
      completedTaskScreen: (context) => const CancelTaskScreen(),
      cancelTaskScreen: (context) => const CancelTaskScreen(),
      newTaskScreen: (context) => const NewTaskScreen(),
      progressTaskScreen: (context) => const ProgressTaskScreen(),
      forgetPasswordEmailScreen: (context) => const ForgetPasswordEmailScreen(),
      inputOTPScreen: (context) => const InputOTPScreen(),
      setNewPasswordScreen: (context) => const SetNewPasswordScreen(),
      profileScreen: (context) => const ProfileScreen(),
      addTaskScreen: (context) => const AddTaskScreen(),
    };
  }
}
