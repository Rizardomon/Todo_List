import 'package:todo_list/app/modules/login/login_module.dart';
import 'package:todo_list/app/shared/auth/auth_controller.dart';
import 'package:todo_list/app/shared/auth/repositories/auth_repository.dart';
import 'package:todo_list/app/shared/auth/repositories/auth_repository_interface.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // $AppController,
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
