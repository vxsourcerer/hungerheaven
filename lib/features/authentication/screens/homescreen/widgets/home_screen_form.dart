import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vision/features/authentication/screens/homescreen/delivered_orders/delivered_food_screen.dart';
import 'package:vision/features/authentication/screens/homescreen/ongoing_food/ongoing_food_screen.dart';
import 'package:vision/features/authentication/screens/logout/logout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    var sharedPref = GetStorage();
    String restaurantId = sharedPref.read("restaurantId") ?? "";

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home Screen"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => {Get.offAll(() => const LogoutScreen())},
              icon: const Icon(Icons.logout_rounded),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'Success/Delivered'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OnGoingOrderScreen(restaurantId: restaurantId),
            // DeliveredOrderScreen(restaurantId: restaurantId),
            const DeliveredOrderScreen(),
          ],
        ),
      ),
    );
  }
}
