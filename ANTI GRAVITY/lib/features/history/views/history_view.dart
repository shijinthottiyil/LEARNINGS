import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofap_app/app/theme/app_colors.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('HISTORY', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (controller.rxHistory.isEmpty) {
          return Center(
            child: Text(
              "No relapses recorded.\nKeep it up!",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.textSecondary,
                fontSize: 18,
              ),
            ),
          );
        }
        return ListView.separated(
          itemCount: controller.rxHistory.length,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final date = controller.rxHistory[index];
            return Card(
              color: AppColors.cardColor,
              child: ListTile(
                leading: const Icon(Icons.history, color: AppColors.primary),
                title: Text(
                  controller.format(date),
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "Relapse",
                  style: GoogleFonts.outfit(color: AppColors.error),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
