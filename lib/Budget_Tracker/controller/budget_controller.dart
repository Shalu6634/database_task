import 'package:database_task/Budget_Tracker/helper/budget_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{

  @override
  void onInit() {
    super.onInit();
    initDb();
  }
  Future<void>  initDb()
  async {
    await BudgetTrackerHelper.budgetTrackerHelper.database;
  }
  void insertRecord()
   {
     BudgetTrackerHelper.budgetTrackerHelper.insertData();
  }


}
