import 'package:be_star/app/app_controller.dart';
import 'package:be_star/app/app_widget.dart';
import 'package:be_star/app/loading/loading.dart';
import 'package:be_star/app/modules/chat/chat_module.dart';
import 'package:be_star/app/modules/home/home_controller.dart';
import 'package:be_star/app/modules/home/home_module.dart';
import 'package:be_star/app/modules/login/login_module.dart';
import 'package:be_star/app/shared/auth/auth_controller.dart';
import 'package:be_star/app/shared/auth/repositories/auth_repository.dart';
import 'package:be_star/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:be_star/app/shared/firebase_store/firebase_store_controller.dart';
import 'package:be_star/app/shared/firebase_store/repositories/firebase_store.dart';
import 'package:be_star/app/shared/firebase_store/repositories/firebase_store_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<IFirebaseStore>((i) => FirebaseStore()),
        Bind((i) => FirebaseStoreController()),
        Bind((i) => AuthController()),
       Bind((i) => HomeController()),
      ]; 

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) =>  Loading()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/chat', module: ChatModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
