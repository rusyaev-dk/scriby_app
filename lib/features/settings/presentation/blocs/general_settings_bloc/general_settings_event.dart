part of 'general_settings_bloc.dart';

sealed class GeneralSettingsEvent extends Equatable {}

final class LoadSettingsEvent extends GeneralSettingsEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleVibrationEvent extends GeneralSettingsEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleNotificationsEvent extends GeneralSettingsEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleCloudSyncEvent extends GeneralSettingsEvent {
  @override
  List<Object?> get props => [];
}
