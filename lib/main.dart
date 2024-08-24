
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Budget_Tracker/view/homeScreen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        )
      ],
    );
  }
}









//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.

import java.util.Scanner;

import static java.lang.System.*;

//class Employees{
//    int id;
//    String name;
//    float salary;
//    void insertRecord(int i,String n,float s)
//    {
//        id = i;
//        name = n;
//        salary = s;
//    }
//    void displayInfo()
//    {
//        out.println(id + " " + name+" "+salary);
//
//
//    }
//
//}
//public class EmployeeTest{
//    public static void main(String args[]){
//        String value="3456";
//        out.println(value.charAt(1));
//      //printing members with a white space
//    }
//}

class Account {
    int acc_no;
    String name;
    float amount;

    void setMethod(int a, String n, float am) {
        acc_no = a;
        name = n;
        amount = am;
    }

    void deposit(float amt) {
        amount = amount + amt;
        out.println(amt + "deposited");
    }

    void withdraw(float amt) {

        if (amount < amt) {
            out.println("Insufficient Balance");
        } else {
            amount = amount - amt;
            out.println(amt + "withDrawn");
        }
    }

    void checkBalance() {
        out.println("Balance is " + amount);
    }

    void display() {
        out.println("your account details here :-" + acc_no + " " + name + " " + amount);
    }
}


 class AccountTest {
    public static void main(String args[]) {
       Account a1 = new Account();
       a1.setMethod(1234,"Shalu",10000);

       //display all detail
       a1.display();
        //balance show
       a1.checkBalance();
       //save balance in bank
       a1.deposit(3000);
       //balance check
       a1.checkBalance();
       a1.withdraw(200);
        a1.checkBalance();
    }
}

