import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';
import '../utils.dart';

class DB {
  static String boxName = 'tinox';
  static String keyName = 'moneyList';
  static List<Money> moneyList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(MoneyAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMoney() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.moneyList = data.cast<Money>();
    logger(DB.moneyList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMoney() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.moneyList);
    DB.moneyList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}

List<Money> testMoney = [
  Money(
    id: getCurrentTimestamp() - 86400 * 4,
    title: '',
    amount: 2000,
    category: '',
    expense: true,
  ),
  Money(
    id: getCurrentTimestamp() - 86400 * 4,
    title: '',
    amount: 4000,
    category: '',
    expense: false,
  ),
  Money(
    id: getCurrentTimestamp() - 86400 * 3,
    title: '',
    amount: 8000,
    category: '',
    expense: true,
  ),
  Money(
    id: getCurrentTimestamp() - 86400 * 3,
    title: '',
    amount: 4000,
    category: '',
    expense: false,
  ),
  Money(
    id: getCurrentTimestamp() - 86400 * 2,
    title: '',
    amount: 1000,
    category: '',
    expense: true,
  ),
  Money(
    id: getCurrentTimestamp() - 86400 * 2,
    title: '',
    amount: 2000,
    category: '',
    expense: false,
  ),
  Money(
    id: getCurrentTimestamp() - 86400,
    title: '',
    amount: 1000,
    category: '',
    expense: true,
  ),
  Money(
    id: getCurrentTimestamp() - 86400,
    title: '',
    amount: 3000,
    category: '',
    expense: false,
  ),
  Money(
    id: getCurrentTimestamp(),
    title: '',
    amount: 3000,
    category: '',
    expense: true,
  ),
  Money(
    id: getCurrentTimestamp(),
    title: '',
    amount: 4000,
    category: '',
    expense: false,
  ),
];
