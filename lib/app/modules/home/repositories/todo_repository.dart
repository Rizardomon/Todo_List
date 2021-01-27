import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/modules/home/models/todo_model.dart';
import 'package:todo_list/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final FirebaseFirestore firestore;

  TodoRepository(this.firestore);

  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future removeEntry(TodoModel model) {
    return model.reference.delete();
  }

  @override
  Future save(TodoModel model) async {
    if (model.reference == null) {
      model.reference = await _db.collection('todo').add({
        'addres': model.addres,
        'addres2': model.addres2,
        'addres3': model.addres3,
        'city': model.city,
        'computerName': model.computerName,
        'computerScreen': model.computerScreen,
        'computerType': model.computerType,
        'createdAt': Timestamp.now(),
        'lockerQuantity': model.lockerQuantity,
        'lockerVersion': model.lockerVersion,
        'name': model.name,
        'number': model.number,
        'homeName': model.homeName,
        'homeNumber': model.homeNumber,
        'homeRentAmount': model.homeRentAmount,
        'homeResidents': model.homeResidents,
        'homeStartDate': Timestamp.now(),
        'homeType': model.homeType,
      });
    } else {
      model.reference.update({
        'addres': model.addres,
        'addres2': model.addres2,
        'addres3': model.addres3,
        'city': model.city,
        'computerName': model.computerName,
        'computerScreen': model.computerScreen,
        'computerType': model.computerType,
        'lockerQuantity': model.lockerQuantity,
        'lockerVersion': model.lockerVersion,
        'name': model.name,
        'number': model.number,
        'homeName': model.homeName,
        'homeNumber': model.homeNumber,
        'homeRentAmount': model.homeRentAmount,
        'homeResidents': model.homeResidents,
        'homeType': model.homeType,
      });
    }
  }
}
