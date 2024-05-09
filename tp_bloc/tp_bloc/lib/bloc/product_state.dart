part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

// data loading state
final class ProductInitial extends ProductState {}

//data loaded state
final class ProductLoaded extends ProductState {
  const ProductLoaded({required this.products});
  final List<ProductModel> products;

  @override
  List<Object> get props => [products];

}

//data load error
final class ProductError extends ProductState {
  const ProductError({required this.error});
  final String error;

  @override
  List<Object> get props => [error];

}
