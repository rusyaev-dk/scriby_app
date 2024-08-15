import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';

part 'general_settings_event.dart';
part 'general_settings_state.dart';

class GeneralSettingsBloc
    extends Bloc<GeneralSettingsEvent, GeneralSettingsState> {
  GeneralSettingsBloc({
    required IGeneralSettingsRepository generalSettingsRepository,
    required ILogger logger,
  })  : _generalSettingsRepository = generalSettingsRepository,
        _logger = logger,
        super(GeneralSettingsLoadingState()) {
    on<LoadSettingsEvent>(_onLoadSettings);
    add(LoadSettingsEvent());
    on<ToggleNotificationsEvent>(_onToggleNotifications);
    on<ToggleVibrationEvent>(_onToggleVibration);
    on<ToggleCloudSyncEvent>(_onToggleCloudSync);
  }

  final IGeneralSettingsRepository _generalSettingsRepository;
  final ILogger _logger;

  Future<void> _onLoadSettings(
    LoadSettingsEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool notifications =
          await _generalSettingsRepository.getNotificationsStatus();
      final bool vibration =
          await _generalSettingsRepository.getVibrationStatus();
      final bool cloudSync =
          await _generalSettingsRepository.getCloudSyncStatus();

      emit(GeneralSettingsLoadedState(
        notifications: notifications,
        vibration: vibration,
        cloudSync: cloudSync,
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(GeneralSettingsFailureState(exception: exception));
    }
  }

  Future<void> _onToggleNotifications(
    ToggleNotificationsEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curNotifications =
          await _generalSettingsRepository.getNotificationsStatus();

      await _generalSettingsRepository.toggleNotifications(!curNotifications);

      final curState = state;
      if (curState is GeneralSettingsLoadedState) {
        emit(curState.copyWith(notifications: !curNotifications));
      }
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(GeneralSettingsFailureState(exception: exception));
    }
  }

  Future<void> _onToggleVibration(
    ToggleVibrationEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curVibration =
          await _generalSettingsRepository.getVibrationStatus();

      await _generalSettingsRepository.toggleVibration(!curVibration);

      final curState = state;
      if (curState is GeneralSettingsLoadedState) {
        emit(curState.copyWith(vibration: !curVibration));
      }
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(GeneralSettingsFailureState(exception: exception));
    }
  }

  Future<void> _onToggleCloudSync(
    ToggleCloudSyncEvent event,
    Emitter<GeneralSettingsState> emit,
  ) async {
    try {
      final bool curCloudSync =
          await _generalSettingsRepository.getCloudSyncStatus();

      await _generalSettingsRepository.toggleCloudSync(!curCloudSync);
      final curState = state;
      if (curState is GeneralSettingsLoadedState) {
        emit(curState.copyWith(cloudSync: !curCloudSync));
      }
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(GeneralSettingsFailureState(exception: exception));
    }
  }
}
