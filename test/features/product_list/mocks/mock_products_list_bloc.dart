import 'package:flutter_test_pyramid_spike/core/error/no_params.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_bloc.dart';
import 'package:flutter_test_pyramid_spike/features/product_list/presentation/bloc/products_list_state.dart';

import '../../cart/mocks/mock_cart_repository.dart';
import 'mock_products_list_respository.dart';

class MockProductsListBloc extends ProductsListBloc {
  MockProductsListBloc()
      : super(
            repository: MockProductsListRepository(),
            cartRepository: MockCartRepository());

  @override
  Stream<ProductsListState> mapEventToState(NoParams event) async* {
    yield ProductsListLoading();
  }
}
