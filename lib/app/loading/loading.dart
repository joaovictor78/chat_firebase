import 'package:be_star/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
  
}

class _LoadingState extends State<Loading> {
  ReactionDisposer disposer;
  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      Future.delayed(Duration(milliseconds: 2000));
      if (auth.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/home');
      } else if (auth.status == AuthStatus.logoff) {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    disposer();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}