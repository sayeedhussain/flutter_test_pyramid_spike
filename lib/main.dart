import 'package:flutter/material.dart';
import 'package:flutter_test_pyramid_spike/core/http/http_client_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/datasources/product_list_remote_datasource_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/data/repositories/products_list_repository_impl.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/domain/repositories/products_list_repository.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/screens/products_list_screen.dart';
import 'package:flutter_test_pyramid_spike/features/cart/presentation/screens/cart_screen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp(
    productsListRepository: ProductsListRepositoryImpl(
        remoteDataSource: ProductListRemoteDataSourceImpl(
            httpClient: HttpClientImpl(client: http.Client())))));

class MyApp extends StatelessWidget {
  const MyApp({this.productsListRepository});

  final ProductsListRepository productsListRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[
            400], //Changing this will change the color of the TabBar
        accentColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                    key: const Key('Main_ProductListTab'),
                    icon: Icon(Icons.list)),
                Tab(
                    key: const Key('Main_CartTab'),
                    icon: Icon(Icons.shopping_cart)),
              ],
            ),
            title: const Text('Shopper'),
          ),
          body: TabBarView(
            children: [
              ProductsListScreen(
                  productsListRepository: productsListRepository),
              CartScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
