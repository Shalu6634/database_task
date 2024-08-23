// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/budget_controller.dart';
//
// class homePage extends StatelessWidget {
//   const homePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(HomeController());
//     return SafeArea(
//         child: Scaffold(appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Budget tracker'),
//         backgroundColor: Colors.grey,
//       ),
//       body: ListView.builder(
//         itemCount: controller.data.length,
//         itemBuilder: (context, index) => Card(
//           color: controller.data[index]['isIncome'] == 1
//               ? Colors.green
//               : Colors.red.shade200,
//           child: ListTile(
//             leading: Text(index.toString()),
//             // title: Text(controller.data[index]['amount'].toString()),
//             // subtitle: Text(controller.data[index]['category'].toString()),
//             // trailing: IconButton(onPressed: (){
//             //
//             // }, icon: Icon(Icons.delete)),
//           ),
//         ),
//       ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => const AlertDialog(
//                   title: Text('Add Records'),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(labelText: 'amount'),
//                       ),
//                       TextField(
//                         decoration: InputDecoration(labelText: 'category'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//     ));
//   }
// }

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
        centerTitle: true,
        title: const Text('Budget Tracker'),
        shadowColor: Colors.black54,
        elevation: 4,
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Income : ',style: TextStyle(fontSize: 17.3),),
                      Text(
                        controller.totalIncome.value.toString(),
                        style: const TextStyle(color: Colors.green, fontSize: 17),
                      ),
                      const Text('Expense : ',style: TextStyle(fontSize: 17.3),),
                      Text(controller.totalExpense.value.toString(),
                          style: const TextStyle(color: Colors.red, fontSize: 17)),
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(9),
                  child: Card(
                    color: controller.data[index]['isIncome'] == 1
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                    child: ListTile(
                        leading: Text(controller.data[index]['id'].toString()),
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
