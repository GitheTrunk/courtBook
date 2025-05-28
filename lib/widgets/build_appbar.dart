import 'package:courtbook/widgets/build_search_section.dart';
import 'package:courtbook/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class BuildAppbar extends StatefulWidget {
  const BuildAppbar({super.key});

  @override
  State<BuildAppbar> createState() => _BuildAppbarState();
}

class _BuildAppbarState extends State<BuildAppbar> {
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
                  UserProfile(),
                  const SizedBox(height: 20),
                  BuildSearchSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
