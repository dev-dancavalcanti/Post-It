import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ContainerMediaContact extends StatelessWidget {
  const ContainerMediaContact(
      {super.key, required this.icon, required this.text, required this.onTap});

  final String icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Row(children: [
          Container(
              color: Theme.of(context).primaryColor,
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  icon,
                ),
              )),
          Text(text),
        ])
      ]),
    );
  }
}
