// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_store_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseStoreController on _FirebaseStoreControllerBase, Store {
  final _$myUserAtom = Atom(name: '_FirebaseStoreControllerBase.myUser');

  @override
  Future<List<DocumentSnapshot>> get myUser {
    _$myUserAtom.context.enforceReadPolicy(_$myUserAtom);
    _$myUserAtom.reportObserved();
    return super.myUser;
  }

  @override
  set myUser(Future<List<DocumentSnapshot>> value) {
    _$myUserAtom.context.conditionallyRunInAction(() {
      super.myUser = value;
      _$myUserAtom.reportChanged();
    }, _$myUserAtom, name: '${_$myUserAtom.name}_set');
  }

  final _$usersAtom = Atom(name: '_FirebaseStoreControllerBase.users');

  @override
  dynamic get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(dynamic value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$getMyUserAsyncAction = AsyncAction('getMyUser');

  @override
  Future getMyUser() {
    return _$getMyUserAsyncAction.run(() => super.getMyUser());
  }

  final _$_FirebaseStoreControllerBaseActionController =
      ActionController(name: '_FirebaseStoreControllerBase');

  @override
  Stream<List<UserModel>> getUsers() {
    final _$actionInfo =
        _$_FirebaseStoreControllerBaseActionController.startAction();
    try {
      return super.getUsers();
    } finally {
      _$_FirebaseStoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'myUser: ${myUser.toString()},users: ${users.toString()}';
    return '{$string}';
  }
}
