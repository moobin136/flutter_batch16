import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_batch16/core/utils/converter_colors.dart';
import 'package:flutter_batch16/core/utils/unit_enums.dart';
import 'package:flutter_batch16/controllers/converter_provider.dart';

/// Tab bar widget for selecting the conversion category
class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();

    final categories = [
      const _TabItem(
        label: 'Length',
        icon: Icons.straighten_rounded,
        category: ConversionCategory.length,
        color: ConverterColors.lengthColor,
      ),
      const _TabItem(
        label: 'Weight',
        icon: Icons.monitor_weight_outlined,
        category: ConversionCategory.weight,
        color: ConverterColors.weightColor,
      ),
      const _TabItem(
        label: 'Temp',
        icon: Icons.thermostat_rounded,
        category: ConversionCategory.temperature,
        color: ConverterColors.tempColor,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EDF8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: categories
            .map(
              (tab) => Expanded(
                child: _buildTab(
                  context,
                  tab: tab,
                  isSelected: provider.selectedCategory == tab.category,
                  onTap: () => provider.setCategory(tab.category),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required _TabItem tab,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? tab.color : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: tab.color.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tab.icon,
              size: 16,
              color: isSelected ? Colors.white : ConverterColors.textSecondary,
            ),
            const SizedBox(width: 5),
            Text(
              tab.label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : ConverterColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem {
  final String label;
  final IconData icon;
  final ConversionCategory category;
  final Color color;

  const _TabItem({
    required this.label,
    required this.icon,
    required this.category,
    required this.color,
  });
}
