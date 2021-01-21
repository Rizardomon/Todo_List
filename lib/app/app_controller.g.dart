// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$isDarkThemeAtom = Atom(name: '_AppControllerBase.isDarkTheme');

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme}
    ''';
  }
}
