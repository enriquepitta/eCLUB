import 'package:eclub/themes/app_colors.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/widgets/custom_bottom_navigation_bar.dart';
import 'package:eclub/widgets/dashboard_header.dart';
import 'package:eclub/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/screens/analysis/analysis_screen.dart';
// Importa los demás screens que usarás en tu navegación

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          if (_selectedIndex == 0)
            const DashboardHeader()
          else
            const SizedBox.shrink(),

          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                SingleChildScrollView(
                  child: const HomeContent(),
                ),

                Container(
                  color: AppColors.background,
                  child: const Center(
                    child: Text('Segunda pantalla'),
                  ),
                ),

                Container(
                  color: AppColors.background,
                  child: const Center(
                    child: Text('Tercera pantalla'),
                  ),
                ),

                const AnalysisScreen(),

                Container(
                  color: AppColors.background,
                  child: const Center(
                    child: Text('Pantalla More'),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildQrButton(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildQrButton() {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: _handleQrButtonPress,
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(
            AppIcons.qr,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  void _handleQrButtonPress() {
    // Implementar la acción del botón QR
  }
}