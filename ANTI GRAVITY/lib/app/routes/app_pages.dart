import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/home/views/home_view.dart';
import '../../features/home/controllers/home_controller.dart';
import '../../features/emergency/views/emergency_view.dart';
import '../../features/emergency/controllers/emergency_controller.dart';

import '../../features/history/views/history_view.dart';
import '../../features/history/controllers/history_controller.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.emergency,
      page: () => const EmergencyView(),
      binding: BindingsBuilder(() {
        Get.put(EmergencyController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.history,
      page: () => const HistoryView(),
      binding: BindingsBuilder(() {
        Get.put(HistoryController());
      }),
      transition: Transition.cupertino,
    ),
  ];
}
