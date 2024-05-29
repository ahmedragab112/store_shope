import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shope/layout/homelayout.dart';
import 'package:store_shope/layout/screens/update/manager/update_product_cubit.dart';
import 'package:store_shope/layout/screens/update/update.dart';
import 'package:store_shope/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        UpDateProduct.routeName: (context) => BlocProvider(
              create: (context) => UpdateProductCubit(),
              child: const UpDateProduct(),
            )
      },
      initialRoute: HomeLayout.routeName,
    );
  }
}
