import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_batch16/core/utils/converter_colors.dart';
import 'package:flutter_batch16/core/utils/unit_enums.dart';
import 'package:flutter_batch16/controllers/converter_provider.dart';

/// Card that displays the converted result with animation
class ResultCard extends StatefulWidget {
  const ResultCard({super.key});

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  String _lastResult = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.95,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnimation = _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerAnimation(String newResult) {
    if (newResult != _lastResult) {
      _lastResult = newResult;
      _controller.reverse().then((_) => _controller.forward());
    }
  }

  Color _getAccentColor(ConversionCategory category) {
    switch (category) {
      case ConversionCategory.length:
        return ConverterColors.lengthColor;
      case ConversionCategory.weight:
        return ConverterColors.weightColor;
      case ConversionCategory.temperature:
        return ConverterColors.tempColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final accent = _getAccentColor(provider.selectedCategory);
    _triggerAnimation(provider.result);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
          color: ConverterColors.cardBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: accent.withValues(alpha: 0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.calculate_rounded,
                    color: accent,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Result',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: ConverterColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            provider.hasInput
                ? _buildResultValue(provider, accent)
                : _buildPlaceholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultValue(ConverterProvider provider, Color accent) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: provider.result,
              style: GoogleFonts.poppins(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: accent,
                height: 1.1,
              ),
            ),
            TextSpan(
              text: '  ${provider.resultSymbol}',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: accent.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Text(
      'Enter a value to see the result',
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: ConverterColors.textSecondary.withValues(alpha: 0.5),
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
