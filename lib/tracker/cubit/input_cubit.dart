import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/tracker/models/transaction.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(const InputState());

  void nameChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(name: value, nameInputStatus: InputStatus.invalid));
    } else {
      emit(state.copyWith(name: value, nameInputStatus: InputStatus.valid));
    }
  }

  void amountChanged(String value) {
    if (value.isEmpty || double.tryParse(value) == null) {
      emit(state.copyWith(
          amount: value, amountInputStatus: InputStatus.invalid));
    } else {
      emit(state.copyWith(amount: value, amountInputStatus: InputStatus.valid));
    }
  }

  void resetInputs() {
    emit(const InputState());
  }
}
