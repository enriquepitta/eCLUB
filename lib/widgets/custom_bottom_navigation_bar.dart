import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/themes/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.backgroundBlur,
            blurRadius: 20,
            offset: const Offset(0, -10),
            spreadRadius: 1,
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: AppColors.background,
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(icon: AppIcons.home, index: 0, label: 'Home'),
              _buildTabItem(icon: AppIcons.transfer, index: 1, label: 'Transfer'),
              const SizedBox(width: 48),
              _buildTabItem(icon: AppIcons.analysis, index: 3, label: 'Analysis'),
              _buildTabItem(icon: AppIcons.menu, index: 4, label: 'More'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({required String icon, required int index, required String label}) {
    final isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? const Color(0xFF888787) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF888787) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}