import 'package:be_star/app/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final UserModel userSelected;
  ChatPage({@required this.userSelected});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  @override
  void initState() {
    print(widget.userSelected);
    ChatController(userSelected: widget.userSelected);
    super.initState();
  }
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userSelected.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Digite uma mensagem...",
                    fillColor: Colors.white70),
                    onChanged: controller.getMensagem,
              )),
              IconButton(
                  icon: Icon(Icons.send, color: Colors.blue, size: 38),
                  onPressed: (){}),
            ],
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }
}
