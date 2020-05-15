import 'package:be_star/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();
  _AuthControllerBase(){
    _authRepository.getUser().then((setUser)).catchError((onError){
      print('Error');
    });
      }
  @observable
  AuthStatus status = AuthStatus.loading;
  @observable
  FirebaseUser user;
  @action 
Future loginWithGoogle() async{
    user = await _authRepository.getGoogleLogin();
  }
 @action 
 Future logoutWithGoogle() async{
   user = await _authRepository.getGoogleLogout();
 }
 @action
  setUser(FirebaseUser value){
   user = value;
   status = user == null ? AuthStatus.logoff : AuthStatus.login; 
  }
}
enum AuthStatus {loading, logoff, login}