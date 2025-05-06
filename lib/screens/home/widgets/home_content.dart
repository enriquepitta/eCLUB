import 'package:flutter/material.dart';
import 'package:eclub/widgets/dashboard_sections/reais_section.dart';
import 'package:eclub/widgets/dashboard_sections/notifications_section.dart';
import 'package:eclub/widgets/dashboard_sections/movements_section.dart';


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const ReaisSection(),
        ),

        Padding(
          padding: EdgeInsets.only(left: 20), // Solo padding izquierdo
          child: NotificationsSection(),
        ),
        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const MovementsSection(),
        ),
      ],
    );
  }
}