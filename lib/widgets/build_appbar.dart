import 'package:courtbook/widgets/build_search_section.dart';
import 'package:courtbook/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class BuildAppbar extends StatelessWidget {
  final UserProfile userProfileWidget;

  const BuildAppbar({super.key, required this.userProfileWidget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 240.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary.withAlpha(200),
                Theme.of(context).secondaryHeaderColor.withAlpha(100),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userProfileWidget,
                  const SizedBox(height: 20),
                  BuildSearchSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
