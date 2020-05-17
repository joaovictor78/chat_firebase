import 'package:be_star/app/modules/home/home_controller.dart';
import 'package:be_star/app/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getMyUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be Star Chat'),
        actions: <Widget>[
          _popUp(controller),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.userList.hasError) {
          return Container(
            child: Text("ocorreu um erro:("),
          );
        }
        if (controller.userList.data == null) {
          return Container(
            child: CircularProgressIndicator(),
          );
        }
        List<UserModel> users = controller.userList.data;
        return Container(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              return Container(
                height: MediaQuery.of(context).size.height/7,
                width: MediaQuery.of(context).size.width/50,
               child: Card(
                 shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50)),
                 elevation: 7,
                 child: ListTile(
                   onTap:()  {
                     controller.getChat(value:  users[index]);
                   } ,
                   title: Text(users[index].name),
                   leading: Icon(Icons.supervised_user_circle, size: 70,),
                 ),
               ),
              );
            },
          ),
        );
      }),
    );
  }
}

Widget _popUp(HomeController controller) => PopupMenuButton<int>(
      icon: Icon(Icons.settings),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Logoff"),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          controller.logoffWithGoogle();
        }
      },
    );
