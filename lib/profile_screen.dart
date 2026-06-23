import 'package:flutter/material.dart';
import 'package:flutter_batch16/widget/cont_info.dart';
import 'package:flutter_batch16/widget/custom_button.dart';
import 'package:flutter_batch16/widget/intereste_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              _buildProfileCardAndDetails(),
              SizedBox(height: 24.h),
              _buildDivider(),
              SizedBox(height: 16.h),
              _buildImageCardRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCardAndDetails() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _image(
            'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
          ),
          SizedBox(height: 16.h),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2d3748),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Passionate about creating user-friendly and engaging digital experiences.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          const Divider(color: Color(0xffedf2f7), thickness: 1.8),
          SizedBox(height: 12.h),
          Align(
            widthFactor: 0.96,
            alignment: AlignmentGeometry.topStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ContInfo(
                  labelText: 'john.doe@example.com',
                  icon: Icons.email,
                ),
                SizedBox(height: 8.h),
                const ContInfo(
                  labelText: '+123 255 25554',
                  icon: Icons.phone_in_talk_sharp,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Follow',
                    onPressed: () {},
                    color: const Color(0xff0066cc),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomButton(
                    label: 'Message',
                    onPressed: () {},
                    color: Colors.white,
                    textColor: const Color(0xff2d3748),
                    hasBorder: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xffcbd5e0), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'Interests',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff2d3748),
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xffcbd5e0), thickness: 1)),
      ],
    );
  }

  Row _buildImageCardRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: InterestCard(
            title: 'Travel',
            subtitle: 'Exploring new places around the world',
            imageUrl:
                'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&q=80&w=200',
          ),
        ),
        SizedBox(width: 12.w),
        const Expanded(
          child: InterestCard(
            title: 'Photography',
            subtitle: 'Capturing moments through the lens',
            imageUrl:
                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=200',
          ),
        ),
      ],
    );
  }

  Widget _image(String imageUrl) {
    return CircleAvatar(
      radius: 50.w,
      backgroundImage: NetworkImage(
        imageUrl,
      ),
    );
  }
}
