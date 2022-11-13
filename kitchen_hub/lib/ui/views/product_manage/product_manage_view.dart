import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/ui/views/product_manage/product_manage_viewmodel.dart';
import 'package:kitchen_hub/ui/widgets/atoms/date_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/product_name.dart';
import 'package:kitchen_hub/ui/widgets/atoms/quantity_selector.dart';
import 'package:kitchen_hub/ui/widgets/atoms/storage_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:kitchen_hub/utils/colors.dart' as app_colors;

class ProductManageView extends StatelessWidget {
  final Record product;

  const ProductManageView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductManageViewModel(product: product),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.product.id == -1
              ? 'Nuevo producto'
              : 'Edición de producto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductName(
                  icon: 'assets/images/product_icon_${model.product.icon}.png',
                  category: model.product.categoryName,
                  name: model.product.productName),
              StorageSelector(
                  title: 'Ubicación:',
                  storages: model.storages,
                  selectedStorage: model.selectedStorage,
                  onStorageChanged: model.changeStorage),
              QuantitySelector(
                  title: 'Cantidad:',
                  quantity: model.quantity,
                  onQuantityChanged: model.changeQuantity),
              DateSelector(
                  title: 'Fecha de registro:', date: model.added, onChanged: model.changeAdded),
              DateSelector(
                  title: 'Fecha de caducidad:', date: model.expiracy, onChanged: model.changeExpiracy),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: media.size.width * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(
                              color: app_colors.primaryVariant,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                        child: TextButton(
                            onPressed: model.mainButton,
                            child: Text(
                              model.product.id == -1 ? 'Crear' : 'Actualizar',
                              style: const TextStyle(color: app_colors.white),
                            )),
                      ),
                    ),
                    model.product.id != -1
                        ? Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: app_colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(
                                onPressed: model.deleteProduct,
                                icon: const Icon(Icons.delete_forever_rounded, size: 20)),
                          ),
                        )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
