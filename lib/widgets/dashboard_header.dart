import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/themes/app_colors.dart';
import 'package:eclub/themes/app_icons.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF00E51),
            Color(0xFFFF6720),
            Color(0xFFFF9E1B),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.53, 1.0],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 23.075,
                backgroundColor: Colors.white,
                child: const Text(
                  'GR',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Oi, João!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Gs. 324.700',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.visibility, color: Colors.white),
                onPressed: () {
                  // Alternar visibilidad de saldo
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildActionButton(AppIcons.convert, 'Converter R\$')),
              Expanded(child: _buildActionButton(AppIcons.recharge, 'Recargas')),
              Expanded(child: _buildActionButton(AppIcons.credit, 'Créditos')),
              Expanded(child: _buildActionButton(AppIcons.payment, 'Pagamentos')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String iconPath, String label) {
    return Column(
      children: [
        Container(
          width: 62.21,
          height: 62.21,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 26,
              height: 26,
              colorFilter: const ColorFilter.mode(Colors.pink, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
