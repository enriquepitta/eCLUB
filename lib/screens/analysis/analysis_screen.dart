import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/themes/app_colors.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/screens/expenses/expenses_analysis_screen.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Análisis',
          style: TextStyle(
            color: Color(0xFFA6A6A6),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFA6A6A6),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.menu_app_bar,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(Color(0xFFA6A6A6), BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Ícono grande de análisis con sombra
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.analysis_big_icon,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '¿Qué deseas revisar?',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AnalysisOption(
                  icon: AppIcons.income,
                  label: 'Ingresos',
                ),
                _AnalysisOption(
                  icon: AppIcons.expense,
                  label: 'Gastos',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalysisOption extends StatelessWidget {
  final String icon;
  final String label;

  const _AnalysisOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Gastos') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ExpensesAnalysisScreen(),
            ),
          );
        }
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 32, height: 32),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}