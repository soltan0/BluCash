import 'dart:developer';

import 'package:blue_cash/app/router/app_routes.dart';
import 'package:blue_cash/core/constants/app_color.dart';
import 'package:blue_cash/features/screen/widgets/next_button.dart';
import 'package:blue_cash/features/screen/widgets/sms_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _currentNumber = '';
  bool get _isCodeComplete => _currentNumber.length == 9;

  final _numberInputKey = GlobalKey<SmsInputState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.textWhite,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 86.h),
                Text(
                  'Mobil nömrənizi\ndaxil edin',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textBlur,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Təsdiq kodu SMS ilə göndəriləcək',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: AppColor.textGrey,
                  ),
                ),
                SizedBox(height: 124.h),
                Row(
                  children: [
                    Container(
                      width: 88.w,
                      height: 40.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        '+994',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SmsInput(
                        key: _numberInputKey,
                        onCodeChanged: (value) {
                          setState(() {
                            _currentNumber = value;
                          });
                        },
                        smsLenght: 9,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textGrey, width: 2),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.textGrey, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),

      // ✅ Правильное место для кнопки
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 5,
          ),
          child: NextButton(
            onPressed: _isCodeComplete
                ? () {
                    final code = _numberInputKey.currentState?.getValue();
                    log('$code');
                    context.push(AppRoutes.opt.path);
                  }
                : null,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(18)),
              backgroundColor: WidgetStateProperty.all(
                _isCodeComplete ? AppColor.buttonColor : AppColor.textGrey,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            child: Text(
              'Devam et',
              style: TextStyle(color: AppColor.textWhite),
            ),
          ),
        ),
      ),
    );
  }
}
