part of 'appearance_settings_bloc.dart';

sealed class AppearanceSettingsState extends Equatable {
  const AppearanceSettingsState();
  
  @override
  List<Object> get props => [];
}

final class AppearanceSettingsInitial extends AppearanceSettingsState {}
