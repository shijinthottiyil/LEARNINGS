import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  late Box _box;
  final _boxName = 'nofap_data';

  Future<StorageService> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    return this;
  }

  // Generic read
  T? read<T>(String key) {
    return _box.get(key);
  }

  // Generic write
  Future<void> write(String key, dynamic value) async {
    await _box.put(key, value);
  }

  // Specific keys
  static const String keyStartDate = 'start_date';
  static const String keyHistory = 'history_logs';

  DateTime? get startDate {
    final dateStr = read<String>(keyStartDate);
    return dateStr != null ? DateTime.parse(dateStr) : null;
  }

  Future<void> saveStartDate(DateTime date) async {
    await write(keyStartDate, date.toIso8601String());
  }

  Future<void> clearStartDate() async {
    await _box.delete(keyStartDate);
  }
  
  List<DateTime> get historyLogs {
    final List<dynamic>? raw = read<List<dynamic>>(keyHistory);
    if (raw == null) return [];
    return raw.map((e) => DateTime.parse(e.toString())).toList();
  }

  Future<void> addHistoryLog(DateTime date) async {
    final logs = historyLogs;
    logs.add(date);
     // Store as string list for simplicity with Hive types
    await write(keyHistory, logs.map((e) => e.toIso8601String()).toList());
  }
}
