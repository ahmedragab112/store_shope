class UpdateProductState {}

class UpdateProductInitial extends UpdateProductState {}

class UpdateProductSuccessState extends UpdateProductState {}

class UpdateProductLoadingState extends UpdateProductState {}

class UpdateProducdErrorState extends UpdateProductState {
 final String errorMassage;

  UpdateProducdErrorState({required this.errorMassage});
}
