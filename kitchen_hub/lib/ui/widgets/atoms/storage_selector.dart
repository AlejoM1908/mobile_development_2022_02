import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class StorageSelector extends StatefulWidget {
  final String title;
  final List storages;
  final void Function(Storage?)? onStorageChanged;
  Storage selectedStorage;

  StorageSelector(
      {super.key,
      required this.title,
      required this.storages,
      required this.onStorageChanged,
      required this.selectedStorage});

  @override
  State<StorageSelector> createState() => _StorageSelectorState();
}

class _StorageSelectorState extends State<StorageSelector> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(widget.title,
              style: const TextStyle(color: app_colors.text, fontSize: 16.0)),
          const Expanded(child: SizedBox(width: 10.0)),
          Container(
            decoration: BoxDecoration(
              color: app_colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: DropdownButton<Storage>(
                value: widget.selectedStorage,
                icon: const Icon(Icons.arrow_drop_down, color: app_colors.text),
                iconSize: 24,
                underline: Container(),
                style: const TextStyle(color: app_colors.text),
                onChanged: widget.onStorageChanged,
                items: widget.storages.map((storage) {
                  return DropdownMenuItem<Storage>(
                    value: storage,
                    child: Text(storage.name),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
