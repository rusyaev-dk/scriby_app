import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appearance_settings_event.dart';
part 'appearance_settings_state.dart';

class AppearanceSettingsBloc extends Bloc<AppearanceSettingsEvent, AppearanceSettingsState> {
  AppearanceSettingsBloc() : super(AppearanceSettingsInitial()) {
    on<AppearanceSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
