import 'package:get/get.dart';
import 'dart:math';

class EmergencyController extends GetxController {
  final List<String> quotes = [
    "The only easy day was yesterday.",
    "Discipline is doing what needs to be done, even if you don't want to do it.",
    "Pain is temporary. Quitting lasts forever.",
    "Your future self will thank you.",
    "Don't give up what you want most for what you want now.",
    "Suffer the pain of discipline or suffer the pain of regret.",
    "You are stronger than your urges.",
    "Breathe. Recall your 'Why'.",
  ];

  final rxQuote = "".obs;

  @override
  void onInit() {
    super.onInit();
    nextQuote();
  }

  void nextQuote() {
    final random = Random();
    rxQuote.value = quotes[random.nextInt(quotes.length)];
  }
}
