import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ss_event.dart';
part 'ss_state.dart';

class SsBloc extends Bloc<SsEvent, SsState> {
  SsBloc() : super(SsInitial()) {
    on<SsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
