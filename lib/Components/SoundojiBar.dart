import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundoji/Constants/UIColors.dart';
import 'package:soundoji/Pages/AboutPage.dart';
import 'LogoTitle.dart';

class SoundojiBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const SoundojiBar({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final UIColors colors = UIColors();

    return SafeArea(
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 8.0, 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height - 20,
              decoration: BoxDecoration(
                  color: colors.defaultWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xfff6f6f6),
                        blurRadius: 0,
                        offset: const Offset(0, 4)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  LogoTitle(colors: colors),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                      },
                      child: Image.asset('assets/images/about.png', width: 45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
