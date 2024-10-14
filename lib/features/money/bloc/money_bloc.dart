import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<GetMoneyEvent>((event, emit) async {
      await getMoney();
      emit(MoneyLoadedState(money: DB.moneyList));
    });

    on<AddMoneyEvent>((event, emit) async {
      DB.moneyList.insert(0, event.money);
      // DB.moneyList.add(event.money);
      await updateMoney();
      emit(MoneyLoadedState(money: DB.moneyList));
    });

    on<EditMoneyEvent>((event, emit) async {
      for (Money money in DB.moneyList) {
        if (money.id == event.money.id) {
          money.title = event.money.title;
          money.amount = event.money.amount;
          money.category = event.money.category;
        }
      }
      await updateMoney();
      emit(MoneyLoadedState(money: DB.moneyList));
    });

    on<DeleteMoneyEvent>((event, emit) async {
      DB.moneyList.removeWhere((element) => element.id == event.id);
      await updateMoney();
      emit(MoneyLoadedState(money: DB.moneyList));
    });
  }
}
