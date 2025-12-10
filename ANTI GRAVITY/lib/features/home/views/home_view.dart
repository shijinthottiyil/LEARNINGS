import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofap_app/app/theme/app_colors.dart';
import 'package:nofap_app/app/routes/app_routes.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'STREAK',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppColors.textSecondary),
            onPressed: () => Get.toNamed(Routes.history),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Circular Timer or Main Display
              _buildTimerDisplay(),
              const SizedBox(height: 48),
              // Motivational Text
              Text(
                "STAY STRONG",
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton(
                  onPressed: () => _showRelapseDialog(context),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.error.withValues(alpha: 0.1),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "I RELAPSED",
                    style: GoogleFonts.outfit(
                      color: AppColors.error,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/emergency');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent, // Teal
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: AppColors.accent.withValues(alpha: 0.5),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "PANIC BUTTON",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerDisplay() {
    return Obx(
      () => Column(
        children: [
          // HERO: Days Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24.0),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: AppColors.surface, width: 1),
            ),
            child: Column(
              children: [
                AnimatedFlipCounter(
                  value: int.tryParse(controller.days) ?? 0,
                  textStyle: GoogleFonts.outfit(
                    fontSize: 96, // Hero size
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    height: 1.0,
                  ),
                  duration: const Duration(milliseconds: 600),
                ),
                Text(
                  "DAYS",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // SECONDARY: H : M : S
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.cardColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.surface.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCompactUnit(controller.hours, "HRS"),
                _buildCompactSeparator(),
                _buildCompactUnit(controller.minutes, "MIN"),
                _buildCompactSeparator(),
                _buildCompactUnit(controller.seconds, "SEC"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactUnit(String value, String label) {
    return Column(
      children: [
        AnimatedFlipCounter(
          value: int.tryParse(value) ?? 0,
          prefix: (value.length == 2 && value.startsWith('0')) ? "0" : "",
          textStyle: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          duration: const Duration(milliseconds: 400),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildCompactSeparator() {
    return Container(
      height: 24,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.surface,
    );
  }

  void _showRelapseDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.surface, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.heart_broken_rounded,
                  color: AppColors.error,
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              // Title
              Text(
                "Reset Streak?",
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              // Content
              Text(
                "This will reset your current progress to day 0. Are you sure you want to continue?",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Actions
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "CANCEL",
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.relapse();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "RESET",
                        style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
