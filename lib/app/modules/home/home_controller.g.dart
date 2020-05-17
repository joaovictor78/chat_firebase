// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$userListAtom = Atom(name: '_HomeControllerBase.userList');

  @override
  ObservableStream<List<UserModel>> get userList {
    _$userListAtom.context.enforceReadPolicy(_$userListAtom);
    _$userListAtom.reportObserved();
    return super.userList;
  }

  @override
  set userList(ObservableStream<List<UserModel>> value) {
    _$userListAtom.context.conditionallyRunInAction(() {
      super.userList = value;
      _$userListAtom.reportChanged();
    }, _$userListAtom, name: '${_$userListAtom.name}_set');
  }

  final _$userSelectedAtom = Atom(name: '_HomeControllerBase.userSelected');

  @override
  UserModel get userSelected {
    _$userSelectedAtom.context.enforceReadPolicy(_$userSelectedAtom);
    _$userSelectedAtom.reportObserved();
    return super.userSelected;
  }

  @override
  set userSelected(UserModel value) {
    _$userSelectedAtom.context.conditionallyRunInAction(() {
      super.userSelected = value;
      _$userSelectedAtom.reportChanged();
    }, _$userSelectedAtom, name: '${_$userSelectedAtom.name}_set');
  }

  final _$getMyUserAsyncAction = AsyncAction('getMyUser');

  @override
  Future getMyUser() {
    return _$getMyUserAsyncAction.run(() => super.getMyUser());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic logoffWithGoogle() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.logoffWithGoogle();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUsers() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getUsers();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'userList: ${userList.toString()},userSelected: ${userSelected.toString()}';
    return '{$string}';
  }
}
