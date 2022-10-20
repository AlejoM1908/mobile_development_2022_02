import 'package:flutter/material.dart';
import 'package:kitchen_hub/ui/views/product_manage/product_manage_viewmodel.dart';
import 'package:kitchen_hub/ui/widgets/atoms/date_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/product_name.dart';
import 'package:kitchen_hub/ui/widgets/atoms/quantity_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/storage_selector.dart';
import 'package:stacked/stacked.dart';

class ProductManageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductManageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProductName(
                  icon: 'assets/images/product_icon_2.png',
                  category: 'Frutas',
                  name: 'Banana'),
              StorageSelector(
                  title: 'Ubicación:',
                  storages: model.storages,
                  selectedStorage: model.selectedStorage,
                  onStorageChanged: model.changeStorage),
              QuantitySelector(
                  title: 'Cantidad:',
                  quantity: model.quantity,
                  onQuantityChanged: model.changeQuantity),
              DateSelector(title: 'Fecha de registro:', date: DateTime.now()),
              DateSelector(title: 'Fecha de caducidad:', date: DateTime.now()),
            ],
          ),
        ),
      ),
    );
  }
}
