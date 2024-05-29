import 'package:bloc/bloc.dart';
import 'package:store_shope/layout/screens/home/manager/home_get_product_state.dart';
import 'package:store_shope/models/product_model.dart';
import 'package:store_shope/services/product_sercives.dart';

class HomeGetProductCubit extends Cubit<HomeGetProductState> {
  HomeGetProductCubit() : super(HomeGetProductInitial());

  getAllProduct() async {
    emit(HomeGetProductLoadingState());
    try {
      List<Products> product = await GetAllProductServices.getAllProduct();
      emit(HomeGetProductSuccessState(product: product));
    } catch (e) {
      emit(HomeGetProductErrorState(errorMassage: e.toString()));
    }
  }
}
