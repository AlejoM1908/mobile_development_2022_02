// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/utils/colors.dart' as app_colors;

class DifficultySelectorDialog extends StatefulWidget {
  /// Dialog widget that allows the user to select the difficulty of the game.
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DifficultySelectorDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  State<DifficultySelectorDialog> createState() =>
      _DifficultySelectorDialogState();
}

class _DifficultySelectorDialogState extends State<DifficultySelectorDialog> {
  List<bool> selected = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: app_colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.request.title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(height: 10),
          Text(
            widget.request.description!,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CheckboxListTile(
            title: const Text('Fácil'),
            value: selected[0],
            onChanged: (value) {
              setState(() {
                setCheckboxValue(0);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Medio'),
            value: selected[1],
            onChanged: (value) {
              setState(() {
                setCheckboxValue(1);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Difícil'),
            value: selected[2],
            onChanged: (value) {
              setState(() {
                setCheckboxValue(2);
              });
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () =>
                selected.contains(true) ? widget.completer(DialogResponse(confirmed: true, data: {
              'difficulty': selected[0]
                  ? 10
                  : selected[1]
                      ? 50
                      : selected[2]
                          ? 80
                          : 50,
            })) : null,
            child: Container(
              child: widget.request.showIconInSecondaryButton!
                  ? const Icon(Icons.check_circle)
                  : Text(
                      widget.request.mainButtonTitle!,
                      style: const TextStyle(color: app_colors.white),
                    ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: !selected.contains(true)
                      ? app_colors.secondaryVariant
                      : app_colors.primary,
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }

  void setCheckboxValue(int index) {
    /// Check one of the checkboxes and uncheck the others
    /// index (int): the index of the checkbox to check
    int lastIndex = selected.indexOf(true);

    if (lastIndex != -1) {
      selected[lastIndex] = false;
    }
    selected[index] = true;
  }
}
