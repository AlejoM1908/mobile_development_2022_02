import 'package:flutter/material.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickingDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  DateTime _selectedDate = DateTime.now();

  DatePickingDialog(
      {super.key, required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: media.size.height * 0.5,
            height: media.size.height * 0.08,
            decoration: const BoxDecoration(
              color: app_colors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            child: Center(child: Text(request.title?? 'Seleccione una fecha', style: const TextStyle(color: app_colors.white, fontSize: 18.0)))),
        SfDateRangePicker(
          selectionColor: app_colors.primary,
          initialSelectedDate: request.data,
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            _selectedDate = args.value as DateTime;
          }
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                completer(DialogResponse(confirmed: false, data: _selectedDate));
              },
              child: Text(request.secondaryButtonTitle ?? 'Cancelar', style: const TextStyle(color: app_colors.red, fontSize: 15.0)),
            ),
            TextButton(
              onPressed: () {
                completer(DialogResponse(confirmed: true, data: _selectedDate));
              },
              child: Text(request.mainButtonTitle ?? 'Aceptar', style: const TextStyle(color: app_colors.primary, fontSize: 15.0)),
            ),
          ],
        )
      ],
    );
  }
}
