import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_shope/layout/screens/update/manager/update_product_state.dart';
import 'package:store_shope/services/update_product.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
 Future<void> updateProduct({required String id}) async{
    emit(UpdateProductLoadingState());
    try {
     await UpdateProduct.updateProduct(
          id: id,
          title: titleController.text,
          price: num.parse(priceController.text),
          description: descriptionController.text,
          image: imageController.text,
          category: categoryController.text);
      emit(UpdateProductSuccessState());
    } catch (e) {
      emit(UpdateProducdErrorState(errorMassage: e.toString()));
    }
  }
}
