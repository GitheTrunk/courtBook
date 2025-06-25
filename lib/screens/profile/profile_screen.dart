import 'package:flutter/material.dart';
import 'profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 30.0),
        Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).secondaryHeaderColor,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/pf.jpg'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  radius: 18,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                    onPressed: () {
                      debugPrint('Edit profile tapped');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: Theme.of(context).cardColor,

          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                ProfileInfo(
                  icon: Icons.person,
                  label: 'User Name',
                  value: 'Trukkk',
                  iconColor: Theme.of(context).unselectedWidgetColor,
                ),
                const Divider(height: 30.0, color: Colors.grey),
                ProfileInfo(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'trunk@gmail.com',
                  iconColor: Theme.of(context).primaryColorLight,
                ),
                const Divider(height: 30.0, color: Colors.grey),
                ProfileInfo(
                  icon: Icons.phone,
                  label: 'Phone',
                  value: '+1234567890',
                  iconColor: Theme.of(context).primaryColor,
                ),
                const Divider(height: 30.0, color: Colors.grey),
                ProfileInfo(
                  icon: Icons.location_on,
                  label: 'Address',
                  value: 'Phnom Penh, Cambodia',
                  iconColor: Theme.of(context).primaryColorDark,
                ),
                const Divider(height: 30.0, color: Colors.grey),
                ProfileInfo(
                  icon: Icons.date_range,
                  label: 'Date of Birth',
                  value: '01/01/1990',
                  iconColor: Theme.of(context).primaryColorLight,
                ),
                const Divider(height: 30.0, color: Colors.grey),
                ProfileInfo(
                  icon: Icons.credit_card,
                  label: 'Payment',
                  value: 'Visa **** **** **** 1234',
                  iconColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
