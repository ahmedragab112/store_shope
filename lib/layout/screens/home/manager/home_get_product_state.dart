import 'package:store_shope/models/product_model.dart';

class HomeGetProductState {}

class HomeGetProductInitial extends HomeGetProductState {}

class HomeGetProductLoadingState extends HomeGetProductState {}

class HomeGetProductSuccessState extends HomeGetProductState {
  final List<Products> product;

  HomeGetProductSuccessState({required this.product});
}

class HomeGetProductErrorState extends HomeGetProductState {
  final String errorMassage;

  HomeGetProductErrorState({required this.errorMassage});
}
