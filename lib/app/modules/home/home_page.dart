import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/app_controller.dart';
import 'home_controller.dart';
import 'models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Entry's"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  AppController appController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showDialog,
          ),
        ],
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
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                            child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Place',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.deepPurple[400],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Addres',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.deepPurple[400],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'City',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  '${model.addres}, ${model.addres2}, ${model.addres3}',
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${model.city}',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.computer,
                                        color: Colors.deepPurple[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Computer',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Name: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.computerName,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Screens: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.computerScreen,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Type: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.computerType,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lock,
                                        color: Colors.deepPurple[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Locker',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Quantity: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.lockerQuantity,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Version: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.lockerVersion,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Name: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.name,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Number: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.number,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.home_work,
                                        color: Colors.deepPurple[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Room',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Alocation: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${model.homeName}, n° ${model.homeNumber}',
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rent Amount: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'R\$ ${model.homeRentAmount}',
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Residents: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.homeResidents,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Type: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        model.homeType,
                                        style: TextStyle(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.deepPurple[400],
                                          ),
                                          onPressed: () => _showDialog(model))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.deepPurple[400],
                                          ),
                                          onPressed: () =>
                                              controller.removeEntry(model))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              // trailing: IconButton(
              //   icon: Icon(Icons.delete),
              //   color: Colors.deepPurple[200],
              //   onPressed: () {
              //     controller.removeEntry(model);
              //   },
              // ),
            },
          );
        },
      ),
    );
  }

  _showDialog([TodoModel model]) {
    model ??= TodoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.name.isEmpty ? 'New Entry' : 'Edit Entry'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.addres,
                      onChanged: (value) => model.addres = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'addres',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.addres2,
                      onChanged: (value) => model.addres2 = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'addres2',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.addres3,
                      onChanged: (value) => model.addres3 = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'addres3',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.city,
                      onChanged: (value) => model.city = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'city',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.computerName,
                      onChanged: (value) => model.computerName = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'computerName',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: model.computerScreen,
                      onChanged: (value) => model.computerScreen = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'computerScreen',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: model.lockerQuantity,
                      onChanged: (value) => model.lockerQuantity = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'lockerQuantity',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.lockerVersion,
                      onChanged: (value) => model.lockerVersion = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'lockerVersion',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.name,
                      onChanged: (value) => model.name = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: model.number,
                      onChanged: (value) => model.number = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.homeName,
                      onChanged: (value) => model.homeName = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'homeName',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: model.homeNumber,
                      onChanged: (value) => model.homeNumber = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'homeNumber',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.homeRentAmount,
                      onChanged: (value) => model.homeRentAmount = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'homeRentAmount',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.homeResidents,
                      onChanged: (value) => model.homeResidents = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'homeResidents',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: model.homeType,
                      onChanged: (value) => model.homeType = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'homeType',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () async {
                  await controller.save(model);
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Save'),
              ),
            ],
          );
        });
  }
}
