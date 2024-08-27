import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/add_data.dart';
import '../component/update_data.dart';
import '../controller/budget_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Budget Tracker'),
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  controller.readLive(value);
                },
                decoration: InputDecoration(
                   hintText: 'search',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 1))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.readIncomeData(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Income : ',
                                style: TextStyle(fontSize: 17.3),
                              ),
                              Text(
                                controller.totalIncome.value.toString(),
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.readIncomeData(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Expense : ',
                                style: TextStyle(fontSize: 17.3),
                              ),
                              Text(controller.totalExpense.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 17)),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.getRecords();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Total : ',
                                style: TextStyle(fontSize: 17.3),
                              ),
                              Text(
                                  controller.totalIncome.value.toString() +
                                      controller.totalExpense.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 17)),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(9),
                  child: Card(
                    color: controller.data[index]['isIncome'] == 1
                        ? Colors.green.shade300
                        : Colors.red.shade300,
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(File(controller.data[index]['img'])),
                        ),
                        title:
                            Text(controller.data[index]['amount'].toString()),
                        subtitle:
                            Text(controller.data[index]['category'].toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildIconButton(context, controller, index),
                            IconButton(
                                onPressed: () {
                                  controller.removeRecord(
                                    int.parse(
                                      controller.data[index]['id'].toString(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        )),
                  ),
                ),
                itemCount: controller.data.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context, controller),
    );
  }
}
