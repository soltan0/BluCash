import 'package:blue_cash/app/router/app_routes.dart';
import 'package:blue_cash/core/constants/app_color.dart';
import 'package:blue_cash/core/widgets/number_pad_widget.dart';
import 'package:blue_cash/provider/pin_put_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../provider/pin_input_provider.dart';

class CreateAPincodeScreen extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  CreateAPincodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pinProvider = Provider.of<PinPutProvider>(context);
    final pinInput = Provider.of<PinInputProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(''), backgroundColor: AppColor.textWhite),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            obscureText: true,
            obscuringCharacter: '.',
            showCursor: false,
            autofocus: true,
            controller: _pinController,
            focusNode: _pinFocusNode,
            length: 4,
            onCompleted: (pin) {
              pinProvider.setPin1(pin);
              _pinController.clear();
              context.push(AppRoutes.ConformAPincode.path);
            },
          ),
          NumberPadWidget(
            onNumberTap: (String p1) {
              pinInput.onNumberTap(p1);
            },
            onDelete: () {
              pinInput.onDelate();
            },
          ),
        ],
      ),
    );
  }
}
