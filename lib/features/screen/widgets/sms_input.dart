import 'dart:developer';

import 'package:blue_cash/features/screen/widgets/sms_textfiled.dart';
import 'package:flutter/material.dart';

class SmsInput extends StatefulWidget {
  final ValueChanged<String>? onCodeChanged;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final int smsLenght;

  const SmsInput({
    super.key,
    this.onCodeChanged,
    required this.smsLenght,
    required this.focusedBorder,
    required this.enabledBorder,
    this.contentPadding,
  });

  @override
  State<SmsInput> createState() => SmsInputState();
}

class SmsInputState extends State<SmsInput> {
  //контроллер для каждого TextField
  late List<TextEditingController> controllers;
  //фокус для управления переходом
  late List<FocusNode> focusNode;

  String getValue() => optCode;

  @override
  void initState() {
    super.initState();
    final length = widget.smsLenght;
    controllers = List.generate(length, (_) => TextEditingController());
    focusNode = List.generate(length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNode) {
      f.dispose();
    }
    super.dispose();
  }

  // функция для проверки кода
  String get optCode => controllers.map((t) => t.text).join();

  @override
  Widget build(BuildContext context) {
    log(optCode);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(widget.smsLenght, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SmsTextfiled(
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  contentPadding: widget.contentPadding,
                  controller: controllers[index],
                  focusNode: focusNode[index],
                  focusedBorder: widget.focusedBorder,
                  enabledBorder: widget.enabledBorder,
                  onChanged: (value) {
                    if (value.isNotEmpty && (index + 1) < focusNode.length) {
                      // переход к слдущему полю
                      FocusScope.of(context).requestFocus(focusNode[index + 1]);
                    } else if (value.isEmpty && index > 0) {
                      // если стер, к возврашаем назад
                      FocusScope.of(context).requestFocus(focusNode[index - 1]);
                    }
                    if (widget.onCodeChanged != null) {
                      widget.onCodeChanged!(optCode);
                    }
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
