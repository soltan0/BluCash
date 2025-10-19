import 'package:blue_cash/core/constants/app_color.dart';
import 'package:blue_cash/features/screen/widgets/next_button.dart';
import 'package:blue_cash/features/screen/widgets/sms_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/widgets/circle_avatar_widgets.dart';

class FirstnamelastnameScreen extends StatefulWidget {
  const FirstnamelastnameScreen({super.key});

  @override
  State<FirstnamelastnameScreen> createState() => _FirstnamelastnameScreenState();
}

class _FirstnamelastnameScreenState extends State<FirstnamelastnameScreen> {
  final TextEditingController _nameSurnameController = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _nameSurnameController.addListener(() {
      setState(() {
        _isFilled = _nameSurnameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameSurnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 👈 позволяет поднимать экран при клавиатуре
      backgroundColor: AppColor.textWhite,
      appBar: AppBar(title: const Text(''), backgroundColor: AppColor.textWhite, elevation: 0),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16 , right: 16 ,) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profilinizi tamamlayın',
                  style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700, color: AppColor.textBlur),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Ad, soyadınızı yazın və istəsəniz, profil şəkli əlavə edin.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textGrey,
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: Column(
                    children: [
                      CircleAvatarWidgets(
                        maxRadius: 55,
                        minRadius: 55,
                        backgroundColor: AppColor.circleColor.withOpacity(1),
                        icon: Icons.person,
                        size: 45,
                        color: AppColor.avatarColor,
                      ),
                      SizedBox(height: 30.h),
                      SmsTextfiled(
                        hintText: 'Adınız və soyadınız',
                        color: AppColor.textGrey,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        border: InputBorder.none,
                        controller: _nameSurnameController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80.h), // немного отступа снизу для прокрутки
              ],
            ),
          ),
        ),
      ),
      // 👇 Кнопка всегда поверх клавиатуры
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 5, // поднимает над клавиатурой
          ),
          child: NextButton(
            onPressed: _isFilled ? () => context.push(AppRoutes.CreateAPincode.path) : null,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(18)),
              backgroundColor: WidgetStateProperty.all(_isFilled ? AppColor.buttonColor : AppColor.textGrey),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            ),
            child: Text(
              'Devam et',
              style: TextStyle(color: AppColor.textWhite, fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}
