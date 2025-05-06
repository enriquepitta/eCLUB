import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclub/themes/app_icons.dart';
import 'package:eclub/themes/app_colors.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'text': '¡Aprovechá 20% de descuento en tu primera transferencia!',
        'color': AppColors.primaryColor,
        'icon': AppIcons.paperPlane,
      },
      {
        'text': 'Recordá que podés pagar tus servicios desde la app sin comisiones.',
        'color': Colors.orange,
        'icon': AppIcons.paperPlane,
      },
      {
        'text': 'Nueva funcionalidad: ahora podés enviar dinero con QR.',
        'color': Colors.green,
        'icon': AppIcons.paperPlane,
      },
      {
        'text': 'Tenés una promoción exclusiva esperándote. ¡No te la pierdas!',
        'color': Colors.blueGrey,
        'icon': AppIcons.paperPlane,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notificaciones',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.8,
              initialPage: 0,
            ),
            padEnds: false,
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 6,
                  right: 6,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: item['color'] as Color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['text'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        item['icon'] as String,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}