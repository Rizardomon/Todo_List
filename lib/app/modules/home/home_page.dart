import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/app_controller.dart';
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
  AppController appController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      'https://avatars0.githubusercontent.com/u/57680110?s=460&u=3a21880d4b7aa28c3216830bbb524d01c0a0365c&v=4'),
                ),
                accountName: Text("Richard Robinson"),
                accountEmail: Text('richard@teste.com')),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.deepPurple[200],
              ),
              title: Text('Logout'),
              subtitle: Text('Finalizar Sessão'),
              onTap: controller.logoff,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [],
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
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: ListTile(
                  title: Text(model.title),
                  onTap: () {
                    _showDialog(model);
                  },
                  trailing: Checkbox(
                    activeColor: Colors.deepPurple,
                    value: model.check,
                    onChanged: (check) {
                      model.check = check;
                      controller.save(model);
                    },
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.deepPurple[200],
                    onPressed: () {
                      controller.removeEntry(model);
                    },
                  ),
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
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () async {
                  await controller.save(model);
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Save'),
              ),
            ],
          );
        });
  }
}
