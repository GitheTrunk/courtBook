import 'package:courtbook/screens/home/home_controller.dart';
import 'package:courtbook/widgets/build_appbar.dart';
import 'package:courtbook/widgets/court_card.dart';
import 'package:courtbook/widgets/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(
    HomeController(),
  ); // Use Get.find instead of creating new

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Obx(() {
          final filteredClubs = homeController.getFilteredClubs();

          return CustomScrollView(
            controller: homeController.scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              BuildAppbar(userProfileWidget: const UserProfile()),
              SliverPadding(
                padding: const EdgeInsets.only(top: 10.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (filteredClubs.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'No clubs found.',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return ClubCard(club: filteredClubs[index]);
                      }
                    },
                    childCount:
                        filteredClubs.isEmpty ? 1 : filteredClubs.length,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
