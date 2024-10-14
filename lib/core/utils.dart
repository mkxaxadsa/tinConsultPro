import 'dart:developer' as developer;

import 'package:tinox/core/models/money.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'db/db.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

int totalIncomes = 0;
int totalExpense = 0;

String getTotalBalance() {
  totalIncomes = 0;
  totalExpense = 0;
  for (Money money in DB.moneyList) {
    if (money.expense) {
      totalExpense += money.amount;
    } else {
      totalIncomes += money.amount;
    }
  }
  return NumberFormat('#,###').format(totalIncomes - totalExpense);
}

String formatTimer(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  String formattedHours = hours.toString();
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  return '$formattedHours:$formattedMinutes';
}

String getCategoryAsset(String cat) {
  if (cat == 'Salary') return 'assets/cat1.svg';
  if (cat == 'Passive') return 'assets/cat2.svg';
  if (cat == 'Investment') return 'assets/cat3.svg';
  if (cat == 'Dividends') return 'assets/cat4.svg';
  if (cat == 'Business') return 'assets/cat5.svg';
  if (cat == 'Rent') return 'assets/cat6.svg';
  if (cat == 'Investment ') return 'assets/cat7.svg';
  if (cat == 'Food') return 'assets/cat8.svg';
  if (cat == 'Transport') return 'assets/cat9.svg';
  if (cat == 'Rest') return 'assets/cat10.svg';
  if (cat == 'Procuerement') return 'assets/cat11.svg';
  return 'assets/cat1.svg';
}

String getWeekdayAbbreviation() {
  DateTime today = DateTime.now();
  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return weekdays[today.weekday - 1];
}
