import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/drawerIcon.svg',
        height: 24,
        width: 24,
        semanticsLabel: 'customIcon',
      ),
      onPressed: () => Scaffold.of(context).openEndDrawer(),
    );
  }
}
