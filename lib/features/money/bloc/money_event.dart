part of 'money_bloc.dart';

abstract class MoneyEvent {}

class GetMoneyEvent extends MoneyEvent {}

class AddMoneyEvent extends MoneyEvent {
  final Money money;
  AddMoneyEvent({required this.money});
}

class EditMoneyEvent extends MoneyEvent {
  final Money money;
  EditMoneyEvent({required this.money});
}

class DeleteMoneyEvent extends MoneyEvent {
  final int id;
  DeleteMoneyEvent({required this.id});
}
