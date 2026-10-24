import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_batch16/core/utils/converter_colors.dart';

/// A generic, reusable dropdown for any unit type
class UnitDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final String Function(T) displayName;
  final ValueChanged<T?> onChanged;

  const UnitDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.displayName,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      decoration: BoxDecoration(
        color: ConverterColors.inputBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ConverterColors.borderColor, width: 1.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ConverterColors.primaryColor,
            size: 22,
          ),
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ConverterColors.textPrimary,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(14),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    displayName(item),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ConverterColors.textPrimary,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
