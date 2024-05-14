import 'package:flutter/material.dart';

import '../utils/ds_key_enum.dart';

class DSNoImageCard extends StatelessWidget {
  const DSNoImageCard({
    required this.height,
    required this.icon,
    required this.iconSize,
    this.width,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final double height;
  final IconData icon;
  final double iconSize;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(DSKeyEnum.noImageCard.name),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: borderRadius,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: Colors.grey.shade600,
      ),
    );
  }
}
