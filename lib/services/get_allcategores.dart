import 'package:store_shope/helper/api_manger.dart';

class GetAllCategoryService {
 
  Future<List<dynamic>> getAllCategorys() async {
    List<dynamic> data =await
        ApiManger.get('https://fakestoreapi.com/products/categories');
    return data;
  }
}
