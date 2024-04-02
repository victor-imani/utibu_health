// order_model.dart

class Order {
  List<OrderItem> orderItems;
  int userId;
  String payment;
  String transactionCode;
  double amount;

  Order({
    required this.orderItems,
    required this.userId,
    required this.payment,
    required this.transactionCode,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
      'userId': userId,
      'payment': payment,
      'transactionCode': transactionCode,
      'amount': amount,
    };
  }
}

class OrderItem {
  String medicationName;
  int quantity;
  int id;

  OrderItem({
    required this.medicationName,
    required this.quantity,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'medicationName': medicationName,
      'quantity': quantity,
      'id': id,
    };
  }
}
