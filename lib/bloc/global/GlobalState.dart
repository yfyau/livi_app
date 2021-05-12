part of 'GlobalCubit.dart';

@immutable
class GlobalState extends Equatable {
  final LiviThemeMode themeMode;
  final List<String> phoneInputs;

  GlobalState({
    LiviThemeMode? theme,
    List<String>? phoneInputs,
  })  : this.themeMode = theme ?? LiviThemeMode.LIGHT,
        this.phoneInputs = phoneInputs ?? [];

  @override
  List<Object> get props => [themeMode, phoneInputs];
}

class GlobalInitial extends GlobalState {
  GlobalInitial({LiviThemeMode? theme})
      : super(
          theme: theme,
          phoneInputs: [],
        );
}

class GlobalLoading extends GlobalState {
  GlobalLoading(GlobalState prevState)
      : super(
          theme: prevState.themeMode,
          phoneInputs: prevState.phoneInputs,
        );
}

class GlobalCompleted extends GlobalState {
  GlobalCompleted(GlobalState prevState, {LiviThemeMode? theme, List<String>? phoneInputs})
      : super(
          theme: theme ?? prevState.themeMode,
          phoneInputs: phoneInputs ?? prevState.phoneInputs,
        );
}