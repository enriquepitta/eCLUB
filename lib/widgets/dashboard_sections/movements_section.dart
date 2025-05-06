import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/themes/app_colors.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/models/movement_model.dart';

class MovementsSection extends StatelessWidget {
  const MovementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MovementModel> movements = [
      MovementModel(
        title: 'Playstation Plus',
        category: 'Entretenimiento',
        amount: '700.000 Gs.',
        date: '04/05/2025',
        icon: AppIcons.entertainment,
        color: AppColors.entertainment,
      ),
      MovementModel(
        title: 'UENO Bank',
        category: 'Retiros',
        amount: '150.000 Gs.',
        date: '03/05/2025',
        icon: AppIcons.bank,
        color: AppColors.bank,
      ),
      MovementModel(
        title: 'Punto Farma',
        category: 'Salud',
        amount: '+1.000.000 Gs.',
        date: '03/05/2025',
        icon: AppIcons.health,
        color: AppColors.health,
      ),
      MovementModel(
        title: 'Pedidos Ya',
        category: 'Comida',
        amount: '55.000 Gs.',
        date: '02/05/2025',
        icon: AppIcons.food,
        color: AppColors.food,
      ),
      MovementModel(
        title: 'Netflix',
        category: 'Entretenimiento',
        amount: '50.000 Gs.',
        date: '01/05/2025',
        icon: AppIcons.entertainment,
        color: AppColors.entertainment,
      ),
      MovementModel(
        title: 'Transporte Uber',
        category: 'Transporte',
        amount: '22.000 Gs.',
        date: '30/04/2025',
        icon: AppIcons.transport,
        color: AppColors.transport,
      ),
      MovementModel(
        title: 'Biggi',
        category: 'Compras',
        amount: '220.000 Gs.',
        date: '29/04/2025',
        icon: AppIcons.shopping,
        color: AppColors.shopping,
      ),
      MovementModel(
        title: 'Farmacenter',
        category: 'Salud',
        amount: '130.000 Gs.',
        date: '28/04/2025',
        icon: AppIcons.health,
        color: AppColors.health,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Movimientos',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: movements.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  // Icono circular
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        item.icon,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Título y categoría
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          item.category,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Monto y fecha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.amount,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        item.date,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}