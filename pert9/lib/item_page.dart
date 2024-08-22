import 'package:flutter/material.dart';
import 'package:pert9/firebase_service.dart';
import 'package:pert9/item_model.dart';
import 'package:pert9/sub_item_page.dart';

class ItemPage extends StatelessWidget {
  // dari file yang kita buat
  // berisi seluruh function yang menjembatani operasi kita ke database
  final FirebaseService firebaseService = FirebaseService();
  ItemPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Firebase"),
      ),
      body: StreamBuilder<List<Item>>(
        stream: firebaseService.getItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          List<Item> items = snapshot.data!;
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    _navigateToSubCollectionsPage(context, items[index]);
                  },
                  title: Text(items[index].name ?? ''),
                  subtitle: Text('Quantity: ${items[index].quantity ?? 0}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            _updateItemDialog(context, items[index]);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            print(items[index].id!);
                            firebaseService.deleteItem(items[index].id!);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItemDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Item newItem = Item(
                        name: nameController.text,
                        quantity: int.parse(quantityController.text));
                    firebaseService.addItem(newItem);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add')),
            ],
          );
        });
  }

  void _updateItemDialog(BuildContext context, Item item) {
    TextEditingController nameController =
        TextEditingController(text: item.name);
    TextEditingController quantityController =
        TextEditingController(text: item.quantity.toString());
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Edit Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    item.name = nameController.text;
                    item.quantity = int.parse(quantityController.text);
                    firebaseService.updateItem(item);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Update')),
            ],
          );
        });
  }

  void _navigateToSubCollectionsPage(BuildContext context, Item item) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SubItemPage(
              item: item,
              firebaseService: firebaseService,
            )));
  }
}
