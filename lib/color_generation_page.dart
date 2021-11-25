import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerationPage extends StatefulWidget {
  const ColorGenerationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorGenerationPage> createState() => _ColorGenerationPageState();
}

class _ColorGenerationPageState extends State<ColorGenerationPage> {
  late Random _random;
  late Color _textColor;
  late Color _backgroundColor;
  late FontWeight _fontWeight;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _textColor = Colors.black;
    _backgroundColor = _getRandomColor;
    _fontWeight = _getRandomFontWeight;
  }

  @override
  Widget build(BuildContext context) => Material(
        child: GestureDetector(
          onTap: () => _generateAndChangeColor(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: _backgroundColor,
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: _fontWeight,
                  color: _textColor,
                ),
              ),
            ),
          ),
        ),
      );

  /// Logic is not desirable in the UI,
  /// as it should be in the logical component.
  /// But since this is simple logic,
  /// there is no point in writing a logical component
  void _generateAndChangeColor() {
    setState(() {
      _textColor = _backgroundColor;
      _backgroundColor = _getRandomColor;
      _fontWeight = _getRandomFontWeight;
    });
  }

  Color get _getRandomColor => Color((_random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  FontWeight get _getRandomFontWeight => FontWeight.values[_random.nextInt(FontWeight.values.length)];
}
