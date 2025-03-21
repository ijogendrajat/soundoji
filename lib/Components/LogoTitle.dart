import 'package:flutter/material.dart';
import 'package:soundoji/Constants/UIColors.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({
    super.key,
    required UIColors colors,
  }) : _colors = colors;

  final UIColors _colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Soundoj',
          style: TextStyle(
            fontSize: 36,
            color: _colors.uiYellow,
            fontFamily: 'Bangers',
          ),
        ),
        Transform.translate(
          offset: const Offset(-5, 0),
          child: Icon(
            Icons.music_note,
            size: 30,
            color: _colors.uiYellow,
          ),
        ),
      ],
    );
  }
}
