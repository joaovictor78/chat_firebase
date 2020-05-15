import 'package:be_star/app/modules/home/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      body: Container(
  child: StreamBuilder(
    stream: Firestore.instance.collection('users').snapshots(), 
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator( ),
        );
      } else {
        return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) => ListTile(title: Text('snapshot.data.documents[index]')),
          itemCount: snapshot.data.documents.length,
        );
      }
    },
  ),
), 
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
              onSelected:(value){
                if(value == 1){
                  controller.logoffWithGoogle();
                }
              },
        );