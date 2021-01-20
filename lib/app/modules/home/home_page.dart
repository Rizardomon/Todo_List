import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Todo's"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (controller.todoList.hasError) {
            print(controller.todoList.error);
            return Center(
              child: RaisedButton(
                onPressed: controller.getList,
                child: Text('Error'),
              ),
            );
          }

          if (controller.todoList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<TodoModel> list = controller.todoList.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              TodoModel model = list[index];
              return ListTile(
                title: Text(model.title),
                onTap: () {
                  _showDialog(model);
                },
                trailing: Checkbox(
                  value: model.check,
                  onChanged: (check) {
                    model.check = check;
                    controller.save(model);
                  },
                ),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.removeEntry(model);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog([TodoModel model]) {
    model ??= TodoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.title.isEmpty ? 'New Todo' : 'Edit Todo'),
            content: TextFormField(
              initialValue: model.title,
              onChanged: (value) => model.title = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Write...',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () async {
                  await controller.save(model);
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Save'),
              ),
            ],
          );
        });
  }
}
