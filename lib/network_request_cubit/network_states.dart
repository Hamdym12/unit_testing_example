import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable{
  @override
  List<Object?> get props => [];
}

class NetworkStateInitial extends NetworkState{}

class NetworkStateLoading extends NetworkState{}

class NetworkStateError extends NetworkState{
  final String error;
  NetworkStateError(this.error);
  @override
  List<Object?> get props => [error];
}

class NetworkStateLoaded extends NetworkState{
  final String data;
  NetworkStateLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
