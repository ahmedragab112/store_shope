import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shope/layout/screens/home/manager/home_get_product_cubit.dart';
import 'package:store_shope/layout/screens/home/manager/home_get_product_state.dart';
import 'package:store_shope/layout/widgets/product_cart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeGetProductCubit, HomeGetProductState>(
      builder: (context, state) {
        if (state is HomeGetProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeGetProductErrorState) {
          return Center(
            child: Text(state.errorMassage),
          );
        } else if (state is HomeGetProductSuccessState) {
          return GridView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (context, index) => ProductCart(
              products: state.product[index],
            ),
            itemCount: state.product.length,
          );
        } else {
          return const Center(child: Text('unKnown State'));
        }
      },
    );
  }
}

/*FutureBuilder<List<Products>>(
      future: GetAllProductServices.getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('there was an error');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          List<Products> data = snapshot.data ?? [];
          return GridView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (context, index) => ProductCart(
             products: data[index],
            ),
            itemCount: data.length,
          );
        }
      },
    );*/