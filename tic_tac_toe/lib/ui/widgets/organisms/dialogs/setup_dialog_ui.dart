// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/models/dialog_type.dart';
import 'package:tic_tac_toe/ui/widgets/organisms/dialogs/difficulty_selector_dialog.dart';
import 'package:tic_tac_toe/ui/widgets/organisms/dialogs/single_message_dialog.dart';

void setupDialogUI() {
  final _dialogService = locator<DialogService>();

  final builders = {
    DialogType.singleMessage: (context, sheetRequest, completer) => Dialog(
        child: _customDialogUI(request: sheetRequest, completer: completer)),
    DialogType.difficultySelector: (context, sheetRequest, completer) => Dialog(
        child: _customDialogUI(request: sheetRequest, completer: completer)),
  };

  _dialogService.registerCustomDialogBuilders(builders);
}

Widget _customDialogUI(
    {required DialogRequest request,
    required Function(DialogResponse) completer}) {
  /// Is a widget that allows to use multiple customs dialogs.
  var dialogType = request.variant as DialogType;

  // Select between all the custo  dialogs options.
  switch (dialogType) {
    case DialogType.singleMessage:
      return SingleMessageDialog(request: request, completer: completer);
    case DialogType.difficultySelector:
      return DifficultySelectorDialog(request: request, completer: completer);
    default:
      return SingleMessageDialog(request: request, completer: completer);
  }
}
