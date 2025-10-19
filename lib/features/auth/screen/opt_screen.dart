import 'dart:developer';

import 'package:blue_cash/app/router/app_routes.dart';
import 'package:blue_cash/core/constants/app_color.dart';
import 'package:blue_cash/features/screen/widgets/next_button.dart';
import 'package:blue_cash/features/screen/widgets/sms_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  String _currentSms = '';
  bool get _isCodeComplete => _currentSms.length == 6;

  final _smsInputKey = GlobalKey<SmsInputState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.textWhite,
      appBar: AppBar(title: const Text(''), backgroundColor: AppColor.textWhite),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
      
              Text(
                'Kod göndərildi',
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700, color: AppColor.textBlur),
              ),
              SizedBox(height: 6.h),
      
              Text(
                textDirection: TextDirection.ltr,
                'SMS ilə göndərilmiş OTP\n6 rəqəmli kodu daxil edin.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGrey,
                ),
              ),
              SizedBox(height: 40.h),
      
              // 🔢 SMS input
              SmsInput(
                key: _smsInputKey,
                onCodeChanged: (value) {
                  setState(() => _currentSms = value);
                },
                smsLenght: 6,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.textGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.textGrey),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text('Kod gəlmədisə,'),
                  GestureDetector(
                    onTap: () {
                      log('yenidən göndər.');
                    },
                    child: Text(
                      ' yenidən göndər.',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
       bottomNavigationBar: SafeArea(
         child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 5, // поднимает над клавиатурой
          ),
          child: NextButton(
            onPressed: _isCodeComplete
                ? () {
                    final code = _smsInputKey.currentState?.getValue();
                    log('SMS code: $code');
                    context.push(AppRoutes.firstNameLastName.path);
                  }
                : null,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(18)),
              backgroundColor: WidgetStateProperty.all<Color>(_isCodeComplete ? AppColor.buttonColor : AppColor.textGrey),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            child: Text('Devam et', style: TextStyle(color: AppColor.textWhite)),
          ),
               ),
       ),
    );
  }
}
