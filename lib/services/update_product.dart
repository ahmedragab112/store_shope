import 'package:store_shope/helper/api_manger.dart';
import 'package:store_shope/models/product_model.dart';

class UpdateProduct {
 static Future<Products> updateProduct(
      {required String id,
      required String title,
      required num price,
      required String description,
      required String image,
      required String category}) async {
    var data = await ApiManger.put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );
    Products product = Products.fromJson(data);
    return product;
  }
}
