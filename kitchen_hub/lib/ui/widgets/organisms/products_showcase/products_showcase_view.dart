import 'package:flutter/material.dart';
import 'package:kitchen_hub/models/db_models.dart';
import 'package:kitchen_hub/ui/widgets/atoms/category_tag.dart';
import 'package:kitchen_hub/ui/widgets/atoms/product_tag.dart';

class ProductShowcase extends StatelessWidget {
  final String categoryTag;
  final List<Record> products;
  final void Function() onProductTap;

  const ProductShowcase({super.key, required this.categoryTag, required this.products, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return products.length == 0 ? Container() : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTag(
            tag: categoryTag,
            count: products.length,
          ),
          Wrap(
            children: products.map((product) => ProductTag(
              onTap: onProductTap,
              product: product,
              color: _getProductColor(product.expiry),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Color _getProductColor(DateTime expiracy) {
    final now = DateTime.now();
    final diff = expiracy.difference(now).inDays;

    if (diff < 0) {
      return Colors.red;
    } else if (diff < 3) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
