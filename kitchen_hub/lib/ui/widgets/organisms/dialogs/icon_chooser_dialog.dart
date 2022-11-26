import 'package:flutter/material.dart';
import 'package:kitchen_hub/app/app.locator.dart';
import 'package:kitchen_hub/services/App/data_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class IconChooserDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final _dataService = locator<DataService>();
  final Set<String> icons = {};
  late String prefix;

  IconChooserDialog(
      {super.key, required this.request, required this.completer}) {
    prefix = request.data['iconPrefix'];
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: media.size.height * 0.5,
          child: FutureBuilder(
            future: getIcons(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              media.size.width / media.size.height * 1.5),
                      itemCount: icons.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            completer(DialogResponse(
                                data: {'icon': icons.elementAt(index)}));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: app_colors.primary, width: 2.0)),
                              child: Image.asset(
                                'assets/images/${icons.elementAt(index)}',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Future<bool> getIcons() async {
    if (prefix == 'storage') {
      for (var i = 0; i < 3; i++) {
        icons.add(
            'storage_icon_${i.toString()}.png');
      }
      icons.add('storage_icon_-1.png');
    }

    if (prefix == 'category') {
      for (var i = 0; i < 9; i++) {
        icons.add(
            'category_icon_${i.toString()}.png');
      }
      icons.add('category_icon_-1.png');
    }

    if (prefix == 'product') {
      for (var i = 0; i < 145; i++) {
        icons.add(
            'product_icon_${i.toString()}.png');
      }
      icons.add('product_icon_-1.png');
    }

    return true;
  }
}
