import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String unit;
  final double maxValue;
  final Function(String)? onChanged;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.unit,
    required this.maxValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixText: widget.unit,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'الحد الأقصى: ${widget.maxValue.toStringAsFixed(2)} ${widget.unit}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
