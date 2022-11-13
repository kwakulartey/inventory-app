part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const ORDERS = _Paths.ORDERS;
  static const ALL_PRODUCTS = _Paths.ALL_PRODUCTS;
  static const LOW_ON_STOCK_PRODUCT =
      _Paths.ALL_PRODUCTS + _Paths.LOW_ON_STOCK_PRODUCT;
  static const OUT_OF_STOCK_PRODUCT =
      _Paths.ALL_PRODUCTS + _Paths.OUT_OF_STOCK_PRODUCT;
  static const NEW_PRODUCT = _Paths.NEW_PRODUCT;
  static const EDIT_PRODUCT = _Paths.EDIT_PRODUCT;
  static const ALL_USERS = _Paths.ALL_USERS;
  static const USER_PROFILE = _Paths.USER_PROFILE;
  static const ADD_USER = _Paths.ADD_USER;
  static const EDIT_USER = _Paths.EDIT_USER;
  static const LOGIN = _Paths.LOGIN;
  static const SHOPPING = _Paths.SHOPPING;
  static const CHECKOUT = _Paths.CHECKOUT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DASHBOARD = '/admin/dashboard';
  static const ORDERS = '/admin/orders';
  static const ALL_PRODUCTS = '/admin/products/view/';
  static const ALL_PRODUCTS_QUERY = '/admin/products/view/:q';
  static const LOW_ON_STOCK_PRODUCT = 'low-on-stock';
  static const OUT_OF_STOCK_PRODUCT = 'out-of-stock';
  static const NEW_PRODUCT = '/admin/products/new';
  static const EDIT_PRODUCT = '/admin/products/edit';
  static const ALL_USERS = '/admin/users';
  static const USER_PROFILE = '/admin/users/profile';
  static const ADD_USER = '/admin/users/new';
  static const EDIT_USER = '/admin/users/edit';
  static const LOGIN = '/login';
  static const SHOPPING = '/shopping';
  static const CHECKOUT = '/checkout';
}
