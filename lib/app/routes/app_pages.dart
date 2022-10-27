import 'package:get/get.dart';

import '../modules/admin/dashboard/bindings/dashboard_binding.dart';
import '../modules/admin/dashboard/views/dashboard_view.dart';
import '../modules/admin/orders/bindings/transaction_history_binding.dart';
import '../modules/admin/orders/bindings/today_sales_binding.dart';
import '../modules/admin/orders/views/today_sales_view.dart';
import '../modules/admin/orders/views/transaction_history_view.dart';
import '../modules/admin/products/bindings/add_product_binding.dart';
import '../modules/admin/products/bindings/all_products_binding.dart';
import '../modules/admin/products/bindings/edit_product_binding.dart';
import '../modules/admin/products/views/add_product_view.dart';
import '../modules/admin/products/views/all_products_view.dart';
import '../modules/admin/products/views/edit_product_view.dart';
import '../modules/admin/products/views/low_on_stock_products_view.dart';
import '../modules/admin/products/views/out_of_stock_products_view.dart';
import '../modules/admin/user-accounts/bindings/add_user_binding.dart';
import '../modules/admin/user-accounts/bindings/all_users_binding.dart';
import '../modules/admin/user-accounts/bindings/user_accounts_binding.dart';
import '../modules/admin/user-accounts/views/add_user_view.dart';
import '../modules/admin/user-accounts/views/all_users_view.dart';
import '../modules/admin/user-accounts/views/user_accounts_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/register_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/user/shopping/bindings/checkout_binding.dart';
import '../modules/user/shopping/bindings/shopping_binding.dart';
import '../modules/user/shopping/views/checkout_view.dart';
import '../modules/user/shopping/views/shopping_view.dart';

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
        GetPage(
          name: _Paths.ALL_USERS,
          page: () => AllUsersView(),
          binding: AllUsersBinding(),
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
      page: () => const AllProdcutsView(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.LOW_ON_STOCK_PRODUCTS,
      page: () => const OutOfStockProdcutsView(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.OUT_OF_STOCK_PRODUCTS,
      page: () => const LowOnStockProdcutsView(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => const ShoppingView(),
      binding: ShoppingBinding(),
      children: [
        GetPage(
          name: _Paths.CHECKOUT,
          page: () => const CheckoutView(),
          binding: CheckoutBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TODAY_SALES,
      page: () => const TodaySalesView(),
      binding: TodaySalesBinding(),
    ),
  ];
}
