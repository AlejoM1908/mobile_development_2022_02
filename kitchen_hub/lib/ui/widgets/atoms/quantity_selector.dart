import 'package:flutter/material.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class QuantitySelector extends StatefulWidget {
  final String title;
  final int quantity;
  final Function(int) onQuantityChanged;

  const QuantitySelector({super.key, required this.title, required this.quantity, required this.onQuantityChanged});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(widget.title, style: const TextStyle(color: app_colors.white, fontSize: 16.0)),
          const Expanded(child: SizedBox(width: 10.0)),
          IconButton(
            icon: const Icon(Icons.remove, color: app_colors.white),
            onPressed: () {
              if (widget.quantity > 0) {
                widget.onQuantityChanged(widget.quantity - 1);
              }
            },
          ),
          Text(widget.quantity.toString(), style: const TextStyle(color: app_colors.white, fontSize: 16.0)),
          IconButton(
            icon: const Icon(Icons.add, color: app_colors.white),
            onPressed: () {
              widget.onQuantityChanged(widget.quantity + 1);
            },
          ),
          SizedBox(width: media.size.width * 0.04),
        ],
      ),
    );
  }
}
