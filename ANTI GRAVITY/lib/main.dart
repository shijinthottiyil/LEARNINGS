import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'app/data/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Services
  await Get.putAsync(() => StorageService().init());

  runApp(
    GetMaterialApp(
      title: "NoFap Tracker",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
