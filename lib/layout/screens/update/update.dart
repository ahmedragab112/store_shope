import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shope/layout/screens/update/manager/update_product_cubit.dart';
import 'package:store_shope/layout/screens/update/manager/update_product_state.dart';
import 'package:store_shope/layout/widgets/custom_button.dart';
import 'package:store_shope/layout/widgets/custom_textfiled.dart';
import 'package:store_shope/models/product_model.dart';

class UpDateProduct extends StatelessWidget {
  const UpDateProduct({super.key});
  static const String routeName = 'Update Product';

  @override
  Widget build(BuildContext context) {
    Products product = ModalRoute.of(context)!.settings.arguments as Products;
    var bloc = BlocProvider.of<UpdateProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('UpdateProduct'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<UpdateProductCubit, UpdateProductState>(
          listener: (context, state) {
            if (state is UpdateProductSuccessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('success')));
            } else if (state is UpdateProductLoadingState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          builder: (context, state) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Update'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: 'enter title',
                      type: 'title',
                      inputType: TextInputType.name,
                      controller: bloc.titleController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: 'enter price',
                      type: 'price',
                      inputType: TextInputType.number,
                      controller: bloc.priceController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: 'enter description',
                      type: 'description',
                      inputType: TextInputType.name,
                      controller: bloc.descriptionController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: 'enter image url',
                      type: 'image',
                      inputType: TextInputType.url,
                      controller: bloc.imageController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFiled(
                      hintText: 'enter category',
                      type: 'category',
                      inputType: TextInputType.name,
                      controller: bloc.categoryController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    function: () {
                      bloc.updateProduct(id: product.id!.toString());
                    },
                    type: 'Update',
                  )
                ]);
          },
        ),
      ),
    );
  }
}
