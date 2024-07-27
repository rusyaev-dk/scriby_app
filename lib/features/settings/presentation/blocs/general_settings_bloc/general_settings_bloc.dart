import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';

part 'general_settings_event.dart';
part 'general_settings_state.dart';

class GeneralSettingsBloc
    extends Bloc<GeneralSettingsEvent, GeneralSettingsState> {
  GeneralSettingsBloc({
    required GeneralSettingsRepositoryI generalSettingsRepository,
  })  : _generalSettingsRepository = generalSettingsRepository,
        super(GeneralSettingsLoadingState()) {
    on<LoadSettingsEvent>(_onLoadSettings);
    add(LoadSettingsEvent());
    on<ToggleNotificationsEvent>(_onToggleNotifications);
    on<ToggleVibrationEvent>(_onToggleVibration);
    on<ToggleCloudSyncEvent>(_onToggleCloudSync);
  }

  final GeneralSettingsRepositoryI _generalSettingsRepository;

  Future<void> _onLoadSettings(
    LoadSettingsEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool notifications =
          await _generalSettingsRepository.getCurrentNotificationsStatus();
      final bool vibration =
          await _generalSettingsRepository.getCurrentVibrationStatus();
      final bool cloudSync =
          await _generalSettingsRepository.getCurrentCloudSyncStatus();

      emit(GeneralSettingsLoadedState(
        notifications: notifications,
        vibration: vibration,
        cloudSync: cloudSync,
      ));
    } catch (exception, stackTrace) {
      emit(GeneralSettingsFailureState(exception: exception));

      print(exception);
    }
  }

  Future<void> _onToggleNotifications(
    ToggleNotificationsEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curNotifications =
          await _generalSettingsRepository.getCurrentNotificationsStatus();

      if (curNotifications) {
        await _generalSettingsRepository.toggleNotificationsOff();
      } else {
        await _generalSettingsRepository.toggleNotificationsOn();
      }

      final prevState = state;
      if (prevState is GeneralSettingsLoadedState) {
        emit(prevState.copyWith(notifications: !curNotifications));
      }
    } catch (exception, stackTrace) {
      emit(GeneralSettingsFailureState(exception: exception));
      print(exception);
    }
  }

  Future<void> _onToggleVibration(
    ToggleVibrationEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curVibration =
          await _generalSettingsRepository.getCurrentVibrationStatus();

      if (curVibration) {
        await _generalSettingsRepository.toggleVibrationOff();
      } else {
        await _generalSettingsRepository.toggleVibrationOn();
      }

      final prevState = state;
      if (prevState is GeneralSettingsLoadedState) {
        emit(prevState.copyWith(vibration: !curVibration));
      }
    } catch (exception, stackTrace) {
      emit(GeneralSettingsFailureState(exception: exception));
      print(exception);
    }
  }

  Future<void> _onToggleCloudSync(
    ToggleCloudSyncEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curCloudSync =
          await _generalSettingsRepository.getCurrentCloudSyncStatus();

      if (curCloudSync) {
        await _generalSettingsRepository.toggleCloudSyncOff();
      } else {
        await _generalSettingsRepository.toggleCloudSyncOn();
      }

      final prevState = state;
      if (prevState is GeneralSettingsLoadedState) {
        emit(prevState.copyWith(cloudSync: !curCloudSync));
      }
    } catch (exception, stackTrace) {
      emit(GeneralSettingsFailureState(exception: exception));
      print(exception);
    }
  }
}
