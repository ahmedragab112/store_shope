import 'package:flutter/material.dart';
import 'package:store_shope/layout/screens/update/update.dart';
import 'package:store_shope/models/product_model.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UpDateProduct.routeName,
            arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 40,
                offset: const Offset(0, 0),
              )
            ]),
            height: 130,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.title?.substring(0, 6) ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${products.price}'),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Image.network(
              products.image ?? '',
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
