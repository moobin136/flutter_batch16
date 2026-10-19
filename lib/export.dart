// ============================================================
// Flutter & Third Party Packages
// ============================================================
export 'dart:convert';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter_svg/svg.dart';
export 'package:http/http.dart';
export 'package:logger/logger.dart';
export 'package:pinput/pinput.dart';
export 'package:shared_preferences/shared_preferences.dart';

// ============================================================
// App Configuration & Routing
// ============================================================
export 'package:flutter_batch16/app/app.dart';
export 'package:flutter_batch16/app/routes.dart';

// ============================================================
// Core (Utils, Theme, Common Widgets)
// ============================================================
export 'package:flutter_batch16/core/theme/app_theme.dart';
export 'package:flutter_batch16/core/utils/app_colors.dart';
export 'package:flutter_batch16/core/utils/app_url.dart';
export 'package:flutter_batch16/core/utils/assets_path.dart';
export 'package:flutter_batch16/core/widgets/cm_appbar.dart';
export 'package:flutter_batch16/core/widgets/cm_snak_bar.dart';
export 'package:flutter_batch16/core/widgets/cm_text.dart';
export 'package:flutter_batch16/core/widgets/custom_bg_svg.dart';
export 'package:flutter_batch16/core/widgets/task_card_common.dart';

// ============================================================
// [M] Models
// ============================================================
export 'package:flutter_batch16/models/api_response.dart';
export 'package:flutter_batch16/models/task_model.dart';
export 'package:flutter_batch16/models/user_model.dart';

// ============================================================
// Services (Networking / API)
// ============================================================
export 'package:flutter_batch16/services/api_caller.dart';

// ============================================================
// [C] Controllers
// ============================================================
export 'package:flutter_batch16/controllers/auth_controller.dart';

// ============================================================
// [V] Views (Screens & UI Widgets)
// ============================================================
// Auth Screens
export 'package:flutter_batch16/views/screens/auth/forget_password_email_screen.dart';
export 'package:flutter_batch16/views/screens/auth/input_otp_screen.dart';
export 'package:flutter_batch16/views/screens/auth/login_screen.dart';
export 'package:flutter_batch16/views/screens/auth/set_new_password_screen.dart';
export 'package:flutter_batch16/views/screens/auth/sign_up_screen.dart';
export 'package:flutter_batch16/views/screens/auth/splash_screen.dart';

// Task Screens
export 'package:flutter_batch16/views/screens/tasks/add_task_screen.dart';
export 'package:flutter_batch16/views/screens/tasks/cancel_task_screen.dart';
export 'package:flutter_batch16/views/screens/tasks/completed_task_screen.dart';
export 'package:flutter_batch16/views/screens/tasks/new_task_screen.dart';
export 'package:flutter_batch16/views/screens/tasks/progress_task_screen.dart';

// Profile & Main Navigation Screens
export 'package:flutter_batch16/views/screens/main_nav_bar_screen.dart';
export 'package:flutter_batch16/views/screens/profile/profile_screen.dart';

// View Specific Widgets
export 'package:flutter_batch16/views/widgets/task_app_bar.dart';
export 'package:flutter_batch16/views/widgets/task_count_card.dart';
