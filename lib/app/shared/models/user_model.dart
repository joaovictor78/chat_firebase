import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String id;
  DocumentReference reference;
  UserModel({this.name, this.reference, this.id});
  factory UserModel.fromUserModel(DocumentSnapshot documents){
    return UserModel(name: documents['name'], id: documents['id'], reference: documents.reference);
  }
  
}