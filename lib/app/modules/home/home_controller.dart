import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:todo_list/app/shared/auth/auth_controller.dart';

import 'models/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    todoList = repository.getTodos().asObservable();
  }

  Future save(TodoModel model) => repository.save(model);

  Future removeEntry(TodoModel model) => repository.removeEntry(model);

  Future logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/');
  }
}
