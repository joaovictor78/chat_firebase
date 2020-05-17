import 'package:be_star/app/shared/auth/auth_controller.dart';
import 'package:be_star/app/shared/firebase_store/firebase_store_controller.dart';
import 'package:be_star/app/shared/models/mensagem_model.dart';
import 'package:be_star/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AuthController auth = Modular.get();
  FirebaseStoreController firebase = Modular.get();
  _HomeControllerBase(){
    getUsers();
  }
  @observable
  ObservableStream<List<UserModel>> userList;
  @observable
  UserModel userSelected;
  @action
  logoffWithGoogle() {
  auth.logoutWithGoogle();
  Modular.to.pushReplacementNamed('/login');
  }
  @action
  getMyUser() async {
    return await firebase.getMyUser();
  }
  @action
   getUsers(){
    userList = firebase.getUsers().asObservable();
    return userList;
  }
  getChat({UserModel value}) async {
    userSelected = await value;
    Modular.to.pushNamed('/chat', arguments: userSelected);
  }
}
