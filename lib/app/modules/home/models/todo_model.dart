import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  String title;
  String subtitle;
  bool check;
  DocumentReference reference;
  var uuid = Uuid();

  TodoModel(
      {this.id,
      this.reference,
      this.title = '',
      this.subtitle = '',
      this.check = false});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'],
        subtitle: doc['subtitle'],
        check: doc['check'],
        reference: doc.reference,
        id: doc['id']);
  }
}
