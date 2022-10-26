import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/products/bindings/all_products_binding.dart';
import '../modules/products/bindings/add_product_binding.dart';
import '../modules/products/bindings/edit_product_binding.dart';
import '../modules/products/views/all_products.dart';
import '../modules/products/views/add_product_view.dart';
import '../modules/products/views/edit_product_view.dart';
import '../modules/transaction-history/bindings/transaction_history_binding.dart';
import '../modules/transaction-history/views/transaction_history_view.dart';
import '../modules/user-accounts/bindings/add_user_binding.dart';
import '../modules/user-accounts/views/add_user_view.dart';
import '../modules/user-accounts/bindings/user_accounts_binding.dart';
import '../modules/user-accounts/views/user_accounts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.USER_ACCOUNTS,
      page: () => const UserAccountsView(),
      binding: UserAccountsBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_USER,
          page: () => const AddUserView(),
          binding: AddUserBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () => TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProdcuts(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
  ];
}
