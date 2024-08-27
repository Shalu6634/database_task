
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/budget_helper.dart';

class HomeController extends GetxController {
  RxList data = [].obs;
  RxBool isIncome = false.obs;
  RxDouble totalIncome = 0.0.obs;
  RxDouble totalExpense = 0.0.obs;
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtSearch = TextEditingController();
  Rx<File>? ImgPath;
  RxString dummyImage =
      'https://t4.ftcdn.net/jpg/05/75/00/85/360_F_575008502_iL4EIHF2rUqNY2L1o45Q15Mny2j6Wn4W.jpg'
          .obs;

  @override
  void onInit() {
    super.onInit();
    initDb();
  }

  void setImg(File img) {
    ImgPath = img.obs;
  }

  void setIncome(bool value) {
    isIncome.value = value;
  }

  Future initDb() async {
    await DbHelper.dbHelper.database;
    await getRecords();
  }

  Future insertRecord(
      double amount, int isIncome, String category, String img) async {
    await DbHelper.dbHelper.insertData(amount, isIncome, category, img);
    await getRecords();
  }

  Future<void> readIncomeData(int isIncome)
  async {
    data.value = await DbHelper.dbHelper.readIncome(isIncome);
  }
  Future<void> readLive(String value)
  async {
    data.value = await DbHelper.dbHelper.readLiveData(value);
  }

  Future getRecords() async {
    totalExpense.value = 0.0;
    totalIncome.value = 0.0;
    data.value = await DbHelper.dbHelper.readData();
    // var filteredData = data.where((i) => i['isIncome'] == (isIncome.value ? 1 : 0)).toList();
    for (var i in data) {
      if (i['isIncome'] == 1) {
        totalIncome.value = totalIncome.value + i['amount'];
      } else {
        totalExpense.value = totalExpense.value + i['amount'];
      }
    }
    return data;
  }

  void incomeRecord() {
    for (var i in data) {
      totalIncome.value = totalIncome.value + i['amount'];
    }
  }

  Future removeRecord(int id) async {
    await DbHelper.dbHelper.deleteData(id);
    await getRecords();
  }

  Future<void> updateRecords(
      int id, double amount, int isIncome, String category, String img) async {
    await DbHelper.dbHelper.updateData(id, amount, isIncome, category, img);
    await getRecords();
  }
}
