// Flutter imports:
import 'package:api_consumption/app/app.locator.dart';
import 'package:api_consumption/models/dialog_type.dart';
import 'package:api_consumption/ui/widgets/organisms/dialogs/single_message_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.singleMessage: (context, sheetRequest, completer) => Dialog(
        child: _customDialogUI(request: sheetRequest, completer: completer))
  };

  dialogService.registerCustomDialogBuilders(builders);
}

Widget _customDialogUI(
    {required DialogRequest request,
    required Function(DialogResponse) completer}) {
  var dialogType = request.variant as DialogType;

  switch (dialogType) {
    case DialogType.singleMessage:
      return SingleMessageDialog(request: request, completer: completer);
    default:
      return SingleMessageDialog(request: request, completer: completer);
  }
}
