part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const USER_ACCOUNTS = _Paths.USER_ACCOUNTS;
  static const TRANSACTION_HISTORY = _Paths.TRANSACTION_HISTORY;
  static const ALL_PRODUCTS = _Paths.ALL_PRODUCTS;
  static const LOW_ON_STOCK_PRODUCTS =
      _Paths.ALL_PRODUCTS + _Paths.LOW_ON_STOCK_PRODUCTS;
  static const OUT_OF_STOCK_PRODUCTS =
      _Paths.ALL_PRODUCTS + _Paths.OUT_OF_STOCK_PRODUCTS;
  static const NEW_PRODUCT = _Paths.NEW_PRODUCT;
  static const EDIT_PRODUCT = _Paths.EDIT_PRODUCT;
  static const ADD_USER = _Paths.USER_ACCOUNTS + _Paths.ADD_USER;
  static const ALL_USERS = _Paths.USER_ACCOUNTS + _Paths.ALL_USERS;
  static const AUTH = _Paths.AUTH;
  static const REGISTER_VIEW = _Paths.AUTH + _Paths.REGISTER_VIEW;
  static const REGISTER = _Paths.AUTH + _Paths.REGISTER;
  static const SHOPPING = _Paths.SHOPPING;
  static const CHECKOUT = _Paths.SHOPPING + _Paths.CHECKOUT;
  static const TODAY_SALES = _Paths.ADMIN + _Paths.TODAY_SALES;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ADMIN = '/admin';
  static const DASHBOARD = '/dashboard';
  static const USER_ACCOUNTS = '/user-accounts';
  static const TRANSACTION_HISTORY = '/transaction-history';
  static const ALL_PRODUCTS = '/products';
  static const LOW_ON_STOCK_PRODUCTS = '/low-on-stock';
  static const OUT_OF_STOCK_PRODUCTS = '/out-of-stock';
  static const NEW_PRODUCT = '/products/new';
  static const EDIT_PRODUCT = '/products/edit';
  static const ADD_USER = '/add-user';
  static const ALL_USERS = '/all-users';
  static const AUTH = '/auth';
  static const REGISTER_VIEW = '/register-view';
  static const REGISTER = '/register';
  static const SHOPPING = '/shopping';
  static const CHECKOUT = '/checkout';
  static const TODAY_SALES = '/today-sales';
}
