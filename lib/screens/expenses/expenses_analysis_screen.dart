
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:eclub/themes/app_colors.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/screens/expenses/widgets/month_calendar.dart';
import 'package:eclub/screens/expenses/widgets/expense_pie_chart.dart';

class ExpensesAnalysisScreen extends StatefulWidget {
  const ExpensesAnalysisScreen({super.key});

  @override
  State<ExpensesAnalysisScreen> createState() => _ExpensesAnalysisScreenState();
}

class _ExpensesAnalysisScreenState extends State<ExpensesAnalysisScreen> {
  int selectedMonthIndex = 11;

  final List<_ExpenseCategory> categories = [
    _ExpenseCategory('Restaurantes y bares', 412000, AppIcons.food, AppColors.foodVibrant),
    _ExpenseCategory('Compras', 165549, AppIcons.shopping, AppColors.shoppingVibrant),
    _ExpenseCategory('Transporte', 79800, AppIcons.transport, AppColors.transportVibrant),
    _ExpenseCategory('Entretenimiento', 136500, AppIcons.entertainment, AppColors.entertainmentVibrant),
    _ExpenseCategory('Banco y finanzas', 95000, AppIcons.bank, AppColors.bankVibrant),
    _ExpenseCategory('Salud y bienestar', 223750, AppIcons.health, AppColors.healthVibrant),
  ];

  @override
  Widget build(BuildContext context) {
    final total = categories.fold(0.0, (sum, item) => sum + item.amount);
    final selectedMonthLabel = DateFormat('MMMM', 'es').format(
      DateTime.now().subtract(Duration(days: (11 - selectedMonthIndex) * 30)),
    ).capitalize();

    final sections = categories.map((c) {
      return PieChartSectionData(
        color: c.color,
        value: c.amount,
        radius: 40,
        title: '',
      );
    }).toList();

    final categoryIcons = categories.map((c) => c.icon).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0, // Evita la elevación al hacer scroll
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Gastos',
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
                border: Border.all(color: const Color(0xFFA6A6A6), width: 1.5),
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
          const SizedBox(height: 10),
          MonthCalendar(
            selectedIndex: selectedMonthIndex,
            onChanged: (i) => setState(() => selectedMonthIndex = i),
          ),

          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                physics: const BouncingScrollPhysics(), // efecto rebote fachero
                overscroll: true,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // Widget de gráfico con iconos
                    ExpensePieChart(
                      total: total,
                      monthLabel: selectedMonthLabel,
                      sections: sections,
                      categoryIcons: categoryIcons,
                    ),

                    const SizedBox(height: 30),
                    _buildCategoryList(),
                    const SizedBox(height: 20), // Espacio al final de la lista
                  ],
                ),
              ),
            ),
          ),

          // Siempre te veo
          _buildExtractButton(),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 12),
          child: Text(
            'Categorías',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        ...categories.map((c) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                // Círculo con icono
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: c.color.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      c.icon,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                          c.color,
                          BlendMode.srcIn
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Gs. ${_formatNumber(c.amount.toInt())}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Indicador de porcentaje
                Text(
                  _formatPercentage(c.amount / categories.fold(0.0, (sum, cat) => sum + cat.amount) * 100),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: c.color,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  // Función para formatear números con punto como separador de miles
  String _formatNumber(int number) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String result = number.toString().replaceAllMapped(
        reg, (Match match) => '${match[1]}.');

    return result;
  }

  Widget _buildExtractButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {},
          child: const Text(
            'Ver extracto',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

String _formatPercentage(double percentage) {
  String formatted = percentage.toStringAsFixed(1);

  List<String> parts = formatted.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? parts[1] : '';

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String result = integerPart.replaceAllMapped(
      reg, (Match match) => '${match[1]}.');

  return decimalPart.isEmpty ? '$result%' : '$result,$decimalPart%';
}

class _ExpenseCategory {
  final String name;
  final double amount;
  final String icon;
  final Color color;

  _ExpenseCategory(this.name, this.amount, this.icon, this.color);
}

extension StringExtension on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}