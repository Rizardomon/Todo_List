import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/home/home_module.dart';
import 'package:todo_list/app/modules/login/login_controller.dart';
import 'package:todo_list/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => LoginController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/home', module: HomeModule()),
      ];
}
