import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shope/layout/screens/home/home.dart';
import 'package:store_shope/layout/screens/home/manager/home_get_product_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String routeName = 'homeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> pages = [
     BlocProvider(
      create: (context) => HomeGetProductCubit()..getAllProduct(),
      child:const Home(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.black,
              ))
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }
}
