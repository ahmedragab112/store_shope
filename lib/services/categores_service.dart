import 'package:store_shope/helper/api_manger.dart';
import 'package:store_shope/models/product_model.dart';

class CategoresService {
  Future<List<Products>> getCategoryProduct({required String category}) async {
    List<dynamic> data = await ApiManger.get(
        'https://fakestoreapi.com/products/category/$category');
    List<Products> products = [];
    for (var i = 0; i < data.length; i++) {
      products.add(
        Products.fromJson(
          data[i],
        ),
      );
    }
    return products;
  }
}
