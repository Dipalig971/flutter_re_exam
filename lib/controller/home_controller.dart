import 'package:flutter/material.dart';
import 'package:flutter_re_exam/modal/shopping_list.dart';
import 'package:get/get.dart';

import '../helper/dp_helper.dart';


class HomeController extends GetxController {
  RxList shoppingList = <ShoppingModel>[].obs;

  // var email= ''.obs;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController titleController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchShoppingItems();
  }

  Future<void> fetchShoppingItems()  async {
    var shop = await DbHelper.dbHelper.getShoppingItems();
   shoppingList.value = shop;
  }


  void addShoppingItem(ShoppingModel shoppingModel) async {
    await DbHelper.dbHelper.insertShoppingItem(shoppingModel);
    fetchShoppingItems();
  }

  void updateShoppingItem(ShoppingModel shoppingModel) async {
    await DbHelper.dbHelper.updateShoppingItem(shoppingModel);
    fetchShoppingItems();
  }


  void deleteShoppingItem(int id) async {
    await DbHelper.dbHelper.deleteShoppingItem(id);
    fetchShoppingItems();
  }
}

