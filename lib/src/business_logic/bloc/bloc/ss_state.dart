part of 'ss_bloc.dart';

abstract class SsState extends Equatable {
  const SsState();
  
  @override
  List<Object> get props => [];
}

class SsInitial extends SsState {}
