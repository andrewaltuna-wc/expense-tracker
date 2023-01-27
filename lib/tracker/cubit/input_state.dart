part of 'input_cubit.dart';

enum InputStatus { initial, valid, invalid }

class InputState extends Equatable {
  const InputState({
    this.name = '',
    this.amount = '',
    this.nameInputStatus = InputStatus.initial,
    this.amountInputStatus = InputStatus.initial,
  });

  final String name;
  final String amount;
  final InputStatus nameInputStatus;
  final InputStatus amountInputStatus;

  InputState copyWith({
    String? name,
    String? amount,
    InputStatus? nameInputStatus,
    InputStatus? amountInputStatus,
  }) {
    return InputState(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      nameInputStatus: nameInputStatus ?? this.nameInputStatus,
      amountInputStatus: amountInputStatus ?? this.amountInputStatus,
    );
  }

  Transaction getTransaction() {
    return Transaction(name: name, amount: double.parse(amount));
  }

  bool get isValid =>
      nameInputStatus == InputStatus.valid &&
      amountInputStatus == InputStatus.valid;

  @override
  List<Object> get props => [name, amount];
}
