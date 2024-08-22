import 'package:flutter/material.dart';
import 'package:pert9/firebase_service.dart';
import 'package:pert9/item_model.dart';

class SubItemPage extends StatelessWidget {
  final FirebaseService firebaseService;
  final Item item;
  SubItemPage({super.key, required this.item, required this.firebaseService});

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
                  title: Text(items[index].name ?? ''),
                  subtitle: Text('Quantity: ${items[index].quantity ?? 0}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            // _updateItemDialog(context, items[index]);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            // firebaseService.deleteItem(items[index].id!);
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
          _addSubItemDialog(context, item);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addSubItemDialog(BuildContext context, Item item) {
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
                    SubItem newSubItem = SubItem(
                        name: nameController.text,
                        quantity: int.parse(quantityController.text));
                    firebaseService.addSubCollection(item.id!, newSubItem);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add')),
            ],
          );
        });
  }
}
