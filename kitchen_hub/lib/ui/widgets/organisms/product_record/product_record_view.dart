import 'package:flutter/material.dart';
import 'package:kitchen_hub/ui/widgets/atoms/date_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/product_name.dart';
import 'package:kitchen_hub/ui/widgets/atoms/quantity_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/storage_selector.dart';
import 'package:kitchen_hub/ui/widgets/organisms/product_record/product_record_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ProductRecordView extends StatelessWidget {
  const ProductRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, ProductRecordViewmodel model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('ProductRecordView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              ProductName(
                name: model.product!.productName,
                category: model.product!.categoryName,
                icon: 'assets/images/product_icon_${model.product!.icon}.png',
              ),
              StorageSelector(
                title: 'Ubicación:',
                selectedStorage: model.currentStorage,
                storages: model.storages,
                onStorageChanged: model.changeStorage,
              ),
              QuantitySelector(
                title: 'Cantidad:',
                quantity: model.product!.amount,
                onQuantityChanged: model.changeAmount,
              ),
              DateSelector(
                title: 'Fecha de registro:',
                date: model.product!.added,
              ),
              DateSelector(
                title: 'Fecha de vencimiento:',
                date: model.product!.expiracy,
              ),
              Container(
                decoration: BoxDecoration(
                  color: app_colors.background,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: model.descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              )
            ],
          ),
        )
      ),
      viewModelBuilder: () => ProductRecordViewmodel(),
    );
  }
}
