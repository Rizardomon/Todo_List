import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/modules/home/models/todo_model.dart';
import 'package:todo_list/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final FirebaseFirestore firestore;

  TodoRepository(this.firestore);

  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore
        .collection('todo')
        .orderBy('title')
        .snapshots()
        .map((query) {
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
      model.reference = await _db.collection('todo').add(
          {'id': model.uuid.v1(), 'title': model.title, 'check': model.check});
    } else {
      model.reference.update({'title': model.title, 'check': model.check});
    }
  }
}
