part of 'privacy_settings_bloc.dart';

sealed class PrivacySettingsState extends Equatable {
  const PrivacySettingsState();
  
  @override
  List<Object> get props => [];
}

final class PrivacySettingsInitial extends PrivacySettingsState {}
