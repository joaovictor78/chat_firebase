import 'package:be_star/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:be_star/app/shared/firebase_store/repositories/firebase_store_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseStore implements IFirebaseStore{
  final IAuthRepository _authRepository = Modular.get();
   @override
    Future getMyUser() async {
    if((await _authRepository.currentUser()) != null){
    final QuerySnapshot result  = await Firestore.instance.collection('users').where('id', isEqualTo: (await _authRepository.currentUser())).getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
          Firestore.instance.collection('users').document( await _authRepository.currentUser()).setData({'name' : _authRepository.getGoogleLogin().then((value) => value.displayName)});
         }
    }
  }
  @override
  getUsers() async {
   final Stream<QuerySnapshot> result =  Firestore.instance.collection('users').snapshots();
   final users = result.listen((data) =>
        data.documents.forEach((doc) => print(doc['name'])));
   return users;
  }
}