import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const ProfileInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
