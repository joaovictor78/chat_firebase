import 'package:be_star/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:be_star/app/shared/firebase_store/repositories/firebase_store_interface.dart';
import 'package:be_star/app/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseStore implements IFirebaseStore{
  final IAuthRepository _authRepository = Modular.get();
  
   @override
    Future getMyUser() async {
    final String userUid = await _authRepository.currentUser();
    if(userUid != null){
    final QuerySnapshot result  = await Firestore.instance.collection('users').where('id', isEqualTo: userUid).getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
         FirebaseUser user = await _authRepository.getGoogleLogin();
         Firestore.instance.collection('users').document(userUid).setData({'name' : user.displayName, 'id': userUid});
         }
    }
  }
  @override
   Stream<List<UserModel>> getUsers() {
   final Stream<QuerySnapshot> result =  Firestore.instance.collection('users').snapshots();
   final users = result.map((query) => query.documents.map((document) => UserModel.fromUserModel(document)).toList());
   return users;
  }
}