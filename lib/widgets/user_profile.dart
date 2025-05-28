import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/pf.jpg'),
        ),
        const SizedBox(width: 10),
        Text(
          'Trunkkk',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                debugPrint('Notification button pressed');
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
