import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/budget_controller.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Budget tracker'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context, index) => Card(
          color: controller.data[index]['isIncome'] == 1
              ? Colors.green
              : Colors.red.shade200,
          child: ListTile(
            leading: Text(controller.data[index]['id'].toString()),
            title: Text(controller.data[index]['amount'].toString()),
            subtitle: Text(controller.data[index]['category'].toString()),
            trailing: IconButton(onPressed: (){

            }, icon: Icon(Icons.delete)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Add Records'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'amount'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'category'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
