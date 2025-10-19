import 'package:flutter/material.dart';

class NumberPadWidget extends StatelessWidget {

  final Function(String) onNumberTap;
  final VoidCallback onDelete;


  const NumberPadWidget({super.key, required this.onNumberTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final number = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];

    return Column(
      children: number.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row.map((item) {
            if (item.isEmpty) return _numButton(' ', disabled: true);
            if (item == '⌫') return _numButton(item, onTap: onDelete);
            return _numButton(item, onTap: () => onNumberTap(item));
          }).toList(),
        );
      }).toList(),
    );
  }
}

 Widget _numButton(String text, {VoidCallback? onTap, bool disabled = false}) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28,
            color: disabled ? Colors.transparent : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

