//! Appbar widget

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150.0,
      elevation: 0,
      backgroundColor: AppTheme.kScaffoldBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  style: GoogleFonts.shareTech(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: AppTheme.kSubheadingColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Tony Stark",
                    style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w400,
                      fontSize: 35.0,
                      color: AppTheme.kGreyShade800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: 30,
                  color: AppTheme.kGreyShade800,
                ),
                const SizedBox(
                  width: 30.0,
                ),
                FaIcon(
                  FontAwesomeIcons.bell,
                  size: 30,
                  color: AppTheme.kGreyShade800,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}
