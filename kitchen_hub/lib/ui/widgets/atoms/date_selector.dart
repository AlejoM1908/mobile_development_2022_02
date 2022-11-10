import 'package:flutter/material.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/models/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class DateSelector extends StatefulWidget {
  final String title;
  DateTime? date;
  void Function(DateTime) onChanged;
  DateSelector({super.key, required this.title, this.date, required this.onChanged});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final _dialogService = locator<DialogService>();
  
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.title, style: const TextStyle(color: app_colors.text, fontSize: 16.0)),
          GestureDetector(
            onTap: () async {
              final response = await _dialogService.showCustomDialog(
                  variant: DialogType.datePicker,
                  title: widget.title,
                  mainButtonTitle: 'Aceptar',
                  secondaryButtonTitle: 'Cancelar',
                  data: widget.date);
              if (response?.confirmed == true) {
                setState(() {
                  widget.date = response?.data;
                  widget.onChanged(response?.data);
                });
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                color: app_colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: media.size.width * 0.4,
              height: 25.0,
              child: Center(
                heightFactor: 1.0,
                child: Text(
                    '${widget.date?.day}/${widget.date?.month}/${widget.date?.year}',
                    style: const TextStyle(color: app_colors.text)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
