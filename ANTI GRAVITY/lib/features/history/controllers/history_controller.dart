import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nofap_app/app/data/services/storage_service.dart';

class HistoryController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();
  
  final rxHistory = <DateTime>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadHistory();
  }

  void _loadHistory() {
    // Sort descending
    final logs = _storage.historyLogs;
    logs.sort((a, b) => b.compareTo(a));
    rxHistory.assignAll(logs);
  }

  String format(DateTime date) {
    return DateFormat.yMMMd().add_jm().format(date);
  }
}
