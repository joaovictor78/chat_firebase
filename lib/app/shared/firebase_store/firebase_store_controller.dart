import 'package:be_star/app/shared/auth/auth_controller.dart';
import 'package:be_star/app/shared/firebase_store/repositories/firebase_store_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'firebase_store_controller.g.dart';

class FirebaseStoreController = _FirebaseStoreControllerBase with _$FirebaseStoreController;

abstract class _FirebaseStoreControllerBase with Store {
final auth = Modular.get<AuthController>();
final IFirebaseStore firebaseStore = Modular.get();

@observable 
Future <List<DocumentSnapshot>> myUser;
@observable
var users;
@action
getMyUser() async {
 myUser = await firebaseStore.getMyUser();
}
@action
getUsers() async {
 users = await firebaseStore.getUsers();
}    

}