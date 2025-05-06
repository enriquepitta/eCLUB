import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:eclub/themes/app_colors.dart';

class ExpensePieChart extends StatelessWidget {
  final double total;
  final String monthLabel;
  final List<PieChartSectionData> sections;
  final List<String> categoryIcons;

  const ExpensePieChart({
    super.key,
    required this.total,
    required this.monthLabel,
    required this.sections,
    required this.categoryIcons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 70,
              startDegreeOffset: 270,
              sections: _createSectionsWithIcons(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                monthLabel,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'Gs. ${NumberFormat('#,###').format(total.toInt())}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _createSectionsWithIcons() {
    List<PieChartSectionData> result = [];

    for (int i = 0; i < sections.length; i++) {
      final section = sections[i];
      final iconPath = i < categoryIcons.length ? categoryIcons[i] : '';

      result.add(
        PieChartSectionData(
          color: section.color,
          value: section.value,
          radius: 50,
          title: '',
          badgeWidget: iconPath.isNotEmpty ? _buildIconBadge(section.color, iconPath) : null,
          badgePositionPercentageOffset: 0.5,
        ),
      );
    }

    return result;
  }

  Widget _buildIconBadge(Color color, String iconPath) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}