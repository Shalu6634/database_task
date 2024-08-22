
import 'package:get/get.dart';

import '../helper/budget_helper.dart';

class HomeController extends GetxController {

  RxList data = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addData();
    initDb();
  }

  Future<void> addData()
  async {
    var financeData = await DbHelper.dbHelper.readData();
    data.assignAll(financeData);
  }
  Future<void> initDb() async {
    await DbHelper.dbHelper.database;
  }

  Future<void> insertRecord() async {
    await DbHelper.dbHelper.insertData();
  }

  Future<void> getRecords()
  async {
    await DbHelper.dbHelper.readData();
  }
}
