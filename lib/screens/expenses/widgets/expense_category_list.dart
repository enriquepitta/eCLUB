import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpenseCategoryItem {
  final String name;
  final double amount;
  final String icon;
  final Color color;

  ExpenseCategoryItem(this.name, this.amount, this.icon, this.color);
}

class ExpenseCategoryList extends StatelessWidget {
  final List<ExpenseCategoryItem> categories;

  const ExpenseCategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories.map((c) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset(c.icon, width: 20, height: 20),
              const SizedBox(width: 10),
              Expanded(child: Text(c.name)),
              Text('Gs. ${c.amount.toInt()}'),
            ],
          ),
        );
      }).toList(),
    );
  }
}