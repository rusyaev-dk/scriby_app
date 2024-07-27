part of 'general_settings_bloc.dart';

sealed class GeneralSettingsState extends Equatable {}

final class GeneralSettingsInitial extends GeneralSettingsState {
  @override
  List<Object?> get props => [];
}

final class GeneralSettingsLoadingState extends GeneralSettingsState {
  @override
  List<Object?> get props => [];
}

final class GeneralSettingsLoadedState extends GeneralSettingsState {
  GeneralSettingsLoadedState({
    required this.notifications,
    required this.vibration,
    required this.cloudSync,
  });

  final bool notifications;
  final bool vibration;
  final bool cloudSync;

  GeneralSettingsLoadedState copyWith({
    bool? notifications,
    bool? vibration,
    bool? cloudSync,
  }) {
    return GeneralSettingsLoadedState(
      notifications: notifications ?? this.notifications,
      vibration: vibration ?? this.vibration,
      cloudSync: cloudSync ?? this.cloudSync,
    );
  }

  @override
  List<Object?> get props => [notifications, vibration, cloudSync];
}

final class GeneralSettingsFailureState extends GeneralSettingsState {
  GeneralSettingsFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
