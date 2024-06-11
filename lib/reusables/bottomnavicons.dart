import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomnavicons extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const bottomnavicons({
    super.key,
    required this.iconData,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.black : Colors.black54;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(color: color,fontSize: 12),

          ),
        ],
      ),
    );
  }
}
