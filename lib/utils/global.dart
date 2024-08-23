import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Budget_Tracker/controller/budget_controller.dart';

var controller = Get.put(HomeController());
TextEditingController txtController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();
