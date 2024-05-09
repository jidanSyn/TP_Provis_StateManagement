import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tp_bloc/models/product.dart';
import 'package:tp_bloc/repository/repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductInitial()) {  //this._productRepository
    on<ProductEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProductInitial()); // is this needed when super already calls it?
      // load
      try {
        final products = await _productRepository.getProducts();
        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductError(error: e.toString()));
      }
    });


  }
}
