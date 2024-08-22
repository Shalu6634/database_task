import 'package:database_task/Budget_Tracker/controller/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetTracker extends StatelessWidget {
  const BudgetTracker({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Buget Tracker"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.insertRecord();
        },
      ),
    );
  }
}
