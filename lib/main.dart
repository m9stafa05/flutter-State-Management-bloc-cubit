import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/controller/cubit/product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProductData(),
      child: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state) {
              case ProductLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProductSuccess():
                // Replace with your actual success widget
                return ListView.builder(
                  itemCount: state.productList.length,
                  itemBuilder: (context, index) {
                    final product = state.productList[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.category),
                    );
                  },
                );
              case ProductFailed():
                // Replace with your actual error widget
                return Center(child: Text('Failed to load products'));
            }
          },
        ),
      ),
    );
  }
}
