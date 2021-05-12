import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/values/LiviTheme.dart';

part 'GlobalState.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit({LiviThemeMode? theme}) : super(GlobalInitial(theme: theme));

  void updateThemeMode(LiviThemeMode theme) {
    emit(GlobalCompleted(state, theme: theme));
  }

  void addPhoneInput(String phone) {
    state.phoneInputs.add(phone);

    print('addPhoneInput - ' + state.phoneInputs.toString());
    emit(GlobalCompleted(state, phoneInputs: state.phoneInputs));
  }

  void clearPhoneInputs() {
    emit(GlobalCompleted(state, phoneInputs: []));
  }
}
