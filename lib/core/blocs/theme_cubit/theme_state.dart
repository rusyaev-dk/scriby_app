part of 'theme_cubit.dart';

final class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
