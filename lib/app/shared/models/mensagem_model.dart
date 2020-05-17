import 'package:cloud_firestore/cloud_firestore.dart';

class MensagemModel {
  String content;
  String idTo;
  String idFrom;
  DocumentReference reference;
  MensagemModel({this.content, this.reference, this.idTo, this.idFrom});
  factory MensagemModel.fromMensagem(DocumentSnapshot documents) {
    return MensagemModel(
        content: documents['content'],
        reference: documents.reference,
        idTo: documents['idTo'],
        idFrom: documents['idFrom']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = this.content;
    data['idTo'] = this.idTo;
    data['idFrom'] = this.idFrom;
    return data;
  }
  Future sendMensagem() async{
    return await Firestore.instance.collection('mensagens').add(toJson());
  }
  
}
