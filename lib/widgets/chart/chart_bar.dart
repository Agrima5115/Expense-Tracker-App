import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color getColor() {
      if (fill >= 0.6) {
        return Colors.green;
      } else if (fill >= 0.4) {
        return Colors.orange;
      } else {
        return Colors.red;
      }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  // : Theme.of(context).colorScheme.primary.withOpacity(0.65),
                  : getColor(),
            ),
          ),
        ),
      ),
    );
  }
}