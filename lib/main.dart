import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initializing ScreenUtil with a standard design size (e.g., 360x690)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student Profile App',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            scaffoldBackgroundColor: const Color(0xFFF9F9FB),
          ),
          home: const StudentProfileScreen(),
        );
      },
    );
  }
}

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  // Simulating a 3-second loading time for the shimmer effect
  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Profile',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3F51B5),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: _isLoading ? _buildShimmerLoading() : _buildProfileCard(),
        ),
      ),
    );
  }

  // 1. Shimmer Loading Placeholder Widget
  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 320.h,
        ),
      ),
    );
  }

  // 2. Main Student Profile Card Widget
  Widget _buildProfileCard() {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar with New Badge
            Badge(
              label: const Text('New'),
              backgroundColor: Colors.redAccent,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: const Color(0xFFC5CAE9),
                child: Icon(
                  Icons.person,
                  size: 45.r,
                  color: const Color(0xFF3F51B5),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Profile Information
            Text(
              'Mike Rack',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'ID: STU-2025-0042',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Computer Science & Engineering',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 24.h),

            // View Details Button (Custom Dialog Trigger)
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: ElevatedButton.icon(
                onPressed: _showDetailsDialog,
                icon: Icon(Icons.info_outline, size: 16.r),
                label: Text('View Details', style: TextStyle(fontSize: 14.sp)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Mark Present Button (Custom Snackbar Trigger)
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: OutlinedButton.icon(
                onPressed: _showCustomSnackbar,
                icon: Icon(Icons.check_circle_outline, size: 16.r, color: Colors.green),
                label: Text(
                  'Mark Present',
                  style: TextStyle(fontSize: 14.sp, color: Colors.green),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. Custom Dialog Box Method
  void _showDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.school, color: const Color(0xFF3F51B5), size: 24.r),
                    SizedBox(width: 8.w),
                    Text(
                      'Student Details',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(height: 8.h),
                _buildDialogRow(Icons.person, 'Name:', 'Mike Rack'),
                SizedBox(height: 8.h),
                _buildDialogRow(Icons.badge, 'ID:', 'STU-2025-0042'),
                SizedBox(height: 8.h),
                _buildDialogRow(Icons.business, 'Dept:', 'Computer Science & Eng.'),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Close',
                      style: TextStyle(fontSize: 14.sp, color: const Color(0xFF3F51B5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper widget to keep dialog layout structured
  Widget _buildDialogRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16.r, color: Colors.grey[600]),
        SizedBox(width: 8.w),
        Text(
          '$label ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 13.sp, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  // 4. Custom SnackBar Method
  void _showCustomSnackbar() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Text(
              'Mike Rack marked as Present',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
            ),
            SizedBox(width: 6.w),
            Icon(Icons.check_box, color: Colors.greenAccent, size: 18.r),
          ],
        ),
        backgroundColor: const Color(0xFF2C2D35),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: EdgeInsets.all(12.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}