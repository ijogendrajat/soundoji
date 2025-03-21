import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'package:soundoji/Components/SoundojiBar.dart';
import 'package:soundoji/Constants/UIColors.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(const Soundoji());
}

class Soundoji extends StatelessWidget {
  const Soundoji({super.key});

  @override
  Widget build(BuildContext context) {
    final UIColors colors = UIColors();

    // Status Bar and Text Color
    FlutterStatusbarcolor.setStatusBarColor(colors.defaultWhite);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soundoji',
      theme: ThemeData(
        fontFamily: 'Cera',
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.grey,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final UIColors _colors;

  @override
  void initState() {
    _colors = UIColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _colors.defaultWhite,
        body: HomePage(),
        appBar: SoundojiBar(height: 80),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
