part of 'one_cubit.dart';

abstract class OneState extends Equatable {
  const OneState();

  @override
  List<Object> get props => [];
}

class OneInitial extends OneState {}

class OneLoading extends OneState {}

class OneSuccess extends OneState {
  const OneSuccess(this.data);

  final List<Post> data;
}

class OneError extends OneState {}
