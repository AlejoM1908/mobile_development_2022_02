// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:api_consumption/utils/colors.dart' as app_colors;

class SingleMessageDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SingleMessageDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            request.title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(height: 10),
          Text(
            request.description!,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => completer(DialogResponse(confirmed: true)),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: app_colors.secondaryVariant,
                  borderRadius: BorderRadius.circular(5.0)),
              child: request.showIconInSecondaryButton!
                  ? const Icon(Icons.check_circle)
                  : Text(
                      request.mainButtonTitle!,
                      style: const TextStyle(color: app_colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
