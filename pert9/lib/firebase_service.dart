import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pert9/item_model.dart';

class FirebaseService {
  // panggil instance db
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionName = 'items';

  Stream<List<Item>> getItems() {
    return _db.collection(collectionName).snapshots().map(
        (snapshot) => snapshot.docs.map((e) => Item.fromFirestore(e)).toList());
  }

  Future<void> addItem(Item item) {
    return _db.collection(collectionName).add(item.toMap());
  }

  Future<void> updateItem(Item item) {
    return _db.collection(collectionName).doc(item.id).update(item.toMap());
  }

  Future<void> deleteItem(String id) {
    return _db.collection(collectionName).doc(id).delete();
  }

  Future<void> addSubCollection(String itemID, SubItem subItem) {
    return _db
        .collection(collectionName)
        .doc(itemID)
        .collection('subItems')
        .add(subItem.toMap());
  }
}
