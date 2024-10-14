import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Money {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool expense;

  Money({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.expense,
  });
}

class MoneyAdapter extends TypeAdapter<Money> {
  @override
  final typeId = 0;

  @override
  Money read(BinaryReader reader) {
    return Money(
      id: reader.read(),
      title: reader.read(),
      amount: reader.read(),
      category: reader.read(),
      expense: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Money obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.amount);
    writer.write(obj.category);
    writer.write(obj.expense);
  }
}
