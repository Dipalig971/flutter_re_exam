import 'package:flutter/material.dart';
import 'package:flutter_re_exam/controller/home_controller.dart';
import 'package:get/get.dart';

import '../modal/shopping_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    TextEditingController editingNameController = TextEditingController();
    TextEditingController editingQuantityController = TextEditingController();
    TextEditingController editingCategoryController = TextEditingController();
    TextEditingController itemNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.sync,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.shoppingList.length,
              itemBuilder: (context, index) {
                final item = controller.shoppingList[index];
                return ListTile(
                  title: Text(item.itemName),
                  subtitle: Text(
                      'Quantity: ${item.quantity}, Category: ${item.category}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteShoppingItem(item.id!);
                    },
                  ),
                );
              },
            );
          }),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    TextField(
                      controller: itemNameController,
                      decoration: InputDecoration(labelText: 'Item Name'),
                    ),
                    TextField(
                      controller: quantityController,
                      decoration: InputDecoration(labelText: 'Quantity'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: categoryController,
                      decoration: InputDecoration(labelText: 'Category'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        controller.addShoppingItem(ShoppingModel(
                          itemName: itemNameController.text,
                          quantity: int.parse(quantityController.text),
                          category: categoryController.text,
                          purchased: false,
                        ));
                        itemNameController.clear();
                        quantityController.clear();
                        categoryController.clear();

                        Get.back();
                      },
                      child: const Text('Save')),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel')),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
