import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, BlocStateData> {
  AppStateBloc() : super(const BlocStateData.init()) {
    on<AppStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
