import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eclub/themes/app_colors.dart';

class MonthCalendar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const MonthCalendar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late final ScrollController _controller;
  late final List<String> _months;
  late final List<String> _shortMonths; // Versión corta para pantallas pequeñas
  late final int _currentIndex;
  final double _itemWidth = 120.0; // Ancho aumentado para acomodar meses largos

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    _months = List.generate(12, (i) {
      final date = DateTime(now.year, now.month - 11 + i);
      return DateFormat("MMMM yyyy", "es").format(date).capitalize();
    });

    // Versión abreviada para pantallas pequeñas
    _shortMonths = List.generate(12, (i) {
      final date = DateTime(now.year, now.month - 11 + i);
      // Formato abreviado: primeras 3 letras del mes + año
      String monthShort = DateFormat("MMM", "es").format(date).capitalize();
      String year = DateFormat("yyyy", "es").format(date);
      return "$monthShort $year";
    });

    _currentIndex = _months.length - 1;
    _controller = ScrollController();

    // Scroll inicial después de renderizar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        scrollToIndex(widget.selectedIndex);
      }
    });
  }

  @override
  void didUpdateWidget(MonthCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex && _controller.hasClients) {
      scrollToIndex(widget.selectedIndex);
    }
  }

  void scrollToIndex(int index) {
    if (!_controller.hasClients) return;

    final screenWidth = MediaQuery.of(context).size.width;
    final centerPosition = screenWidth / 2 - _itemWidth / 2;

    final targetPosition = (index * _itemWidth) - centerPosition;

    final maxScroll = _controller.position.maxScrollExtent;
    final clampedPosition = targetPosition.clamp(0.0, maxScroll);

    // Animación de scroll
    _controller.animateTo(
      clampedPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool useShortFormat = screenWidth < 360; // Usar formato corto en pantallas pequeñas

    return SizedBox(
      height: 40,
      width: screenWidth,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            if (widget.selectedIndex == _currentIndex && !_controller.position.isScrollingNotifier.value) {
              // Asegurar que el mes actual esté visible cuando se completa la carga
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_controller.hasClients) {
                  scrollToIndex(widget.selectedIndex);
                }
              });
            }
          }
          return false;
        },
        child: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemExtent: _itemWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _months.length,
          itemBuilder: (context, index) {
            final isSelected = index == widget.selectedIndex;
            return GestureDetector(
              onTap: () => widget.onChanged(index),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      // Elegir formato según el tamaño de la pantalla
                      useShortFormat ? _shortMonths[index] : _months[index],
                      textAlign: TextAlign.center,
                      maxLines: 1, // Forzar una sola línea
                      overflow: TextOverflow.ellipsis, // Mostrar elipsis si no cabe
                      style: TextStyle(
                        fontSize: useShortFormat ? 14 : 15,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? AppColors.primaryColor : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

extension _CapitalizeExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}