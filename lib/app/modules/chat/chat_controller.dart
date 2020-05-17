import 'package:be_star/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:be_star/app/shared/models/mensagem_model.dart';
import 'package:be_star/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';
 
class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
    final IAuthRepository _authRepository = Modular.get();
    final UserModel userSelected;
    String mensagem;
    String myId;
    String idFrom;
    MensagemModel mensagemModel;
   _ChatControllerBase({this.userSelected}){
   idFrom = userSelected.id;
   getMyId();
   mensagemModel = MensagemModel(content: mensagem,  idFrom: idFrom, idTo: myId);
   }
   getMyId() async{
    return myId = await _authRepository.currentUser();
   }
   getMensagem(String value){
    mensagem = value;
   }
   Future sendMensagem() async{
   await mensagemModel.sendMensagem();
  }
}
