import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_batch16/core/utils/converter_colors.dart';
import 'package:flutter_batch16/core/utils/unit_enums.dart';
import 'package:flutter_batch16/controllers/converter_provider.dart';
import 'package:flutter_batch16/views/widgets/unit_converter/unit_dropdown.dart';

/// Main card containing input field, from/to dropdowns, and swap button
class ConverterCard extends StatelessWidget {
  const ConverterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ConverterColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: ConverterColors.shadowColor,
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InputField(),
          const SizedBox(height: 18),
          _FromToSection(),
        ],
      ),
    );
  }
}

// ─────────────────────── Input Field ──────────────────────────

class _InputField extends StatefulWidget {
  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();

    // Sync the controller if external changes happen (e.g. category change)
    if (_controller.text != provider.inputText && provider.inputText.isEmpty) {
      _controller.clear();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Value',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ConverterColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: ConverterColors.inputBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ConverterColors.borderColor, width: 1.5),
          ),
          child: TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
            ],
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: ConverterColors.textPrimary,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '0',
              hintStyle: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: ConverterColors.textSecondary.withValues(alpha: 0.5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        provider.updateInput('');
                      },
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: ConverterColors.textSecondary,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            onChanged: (value) {
              provider.updateInput(value);
            },
          ),
        ),
      ],
    );
  }
}

// ───────────────────── From/To Section ────────────────────────

class _FromToSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();

    return Column(
      children: [
        // FROM Dropdown
        _LabeledDropdown(
          label: 'From',
          child: _buildFromDropdown(context, provider),
        ),
        const SizedBox(height: 12),

        // Swap Button (centered)
        _SwapButton(),

        const SizedBox(height: 12),

        // TO Dropdown
        _LabeledDropdown(
          label: 'To',
          child: _buildToDropdown(context, provider),
        ),
      ],
    );
  }

  Widget _buildFromDropdown(BuildContext context, ConverterProvider provider) {
    switch (provider.selectedCategory) {
      case ConversionCategory.length:
        return UnitDropdown<LengthUnit>(
          value: provider.fromLength,
          items: provider.lengthUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setFromLength(u!),
        );
      case ConversionCategory.weight:
        return UnitDropdown<WeightUnit>(
          value: provider.fromWeight,
          items: provider.weightUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setFromWeight(u!),
        );
      case ConversionCategory.temperature:
        return UnitDropdown<TemperatureUnit>(
          value: provider.fromTemp,
          items: provider.tempUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setFromTemp(u!),
        );
    }
  }

  Widget _buildToDropdown(BuildContext context, ConverterProvider provider) {
    switch (provider.selectedCategory) {
      case ConversionCategory.length:
        return UnitDropdown<LengthUnit>(
          value: provider.toLength,
          items: provider.lengthUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setToLength(u!),
        );
      case ConversionCategory.weight:
        return UnitDropdown<WeightUnit>(
          value: provider.toWeight,
          items: provider.weightUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setToWeight(u!),
        );
      case ConversionCategory.temperature:
        return UnitDropdown<TemperatureUnit>(
          value: provider.toTemp,
          items: provider.tempUnits,
          displayName: (u) => u.displayName,
          onChanged: (u) => provider.setToTemp(u!),
        );
    }
  }
}

class _LabeledDropdown extends StatelessWidget {
  final String label;
  final Widget child;

  const _LabeledDropdown({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ConverterColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

// ─────────────────────── Swap Button ──────────────────────────

class _SwapButton extends StatefulWidget {
  @override
  State<_SwapButton> createState() => _SwapButtonState();
}

class _SwapButtonState extends State<_SwapButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    context.read<ConverterProvider>().swapUnits();
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedBuilder(
          animation: _rotateAnimation,
          builder: (context, child) => Transform.rotate(
            angle: _rotateAnimation.value * 3.14159,
            child: child,
          ),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ConverterColors.primaryLight, ConverterColors.primaryDark],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ConverterColors.primaryColor.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.swap_vert_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
