import 'package:store_shope/helper/api_manger.dart';

import 'package:store_shope/models/product_model.dart';

class GetAllProductServices {
 static Future<List<Products>> getAllProduct() async {
    List<dynamic> reponse =
        await ApiManger.get('https://fakestoreapi.com/products');
    List<Products> products = [];
    for (var i = 0; i < reponse.length; i++) {
      products.add(
        Products.fromJson(
          reponse[i],
        ),
      );
    }
    return products;
  }
}
