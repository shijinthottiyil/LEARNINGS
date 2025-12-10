import 'dart:async';
import 'package:get/get.dart';
import 'package:nofap_app/app/data/services/storage_service.dart';

class HomeController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();

  // Observables
  final rxDuration = Duration.zero.obs;
  final rxStartDate = DateTime.now().obs;
  
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _loadData();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _loadData() {
    final savedDate = _storage.startDate;
    if (savedDate != null) {
      rxStartDate.value = savedDate;
    } else {
      // First time user, set start date to now
      _resetStartDate();
    }
    _updateDuration();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDuration();
    });
  }

  void _updateDuration() {
    final now = DateTime.now();
    rxDuration.value = now.difference(rxStartDate.value);
  }

  Future<void> relapse() async {
    // Save current streak to history
    await _storage.addHistoryLog(DateTime.now());
    
    // Reset timer
    await _resetStartDate();
  }

  Future<void> _resetStartDate() async {
    final now = DateTime.now();
    rxStartDate.value = now;
    await _storage.saveStartDate(now);
    _updateDuration();
  }
  
  // Getters for UI
  String get days => rxDuration.value.inDays.toString().padLeft(2, '0');
  String get hours => (rxDuration.value.inHours % 24).toString().padLeft(2, '0');
  String get minutes => (rxDuration.value.inMinutes % 60).toString().padLeft(2, '0');
  String get seconds => (rxDuration.value.inSeconds % 60).toString().padLeft(2, '0');
}
