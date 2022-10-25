import 'package:get/get.dart';
import 'package:inventory_1/app/modules/user-accounts/bindings/user_accounts_binding.dart';
import 'package:inventory_1/app/modules/user-accounts/views/user_accounts_view.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/transaction-history/bindings/transaction_history_binding.dart';
import '../modules/transaction-history/views/transaction_history_view.dart';

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
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () =>  TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
  ];
}
