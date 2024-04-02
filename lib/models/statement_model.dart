class Statement {
  final DateTime date;
  final int userId;
  final String description;
  final double totalAmount;
  final String paymentStatus;

  Statement({
    required this.date,
    required this.userId,
    required this.description,
    required this.totalAmount,
    required this.paymentStatus,
  });

  factory Statement.fromJson(Map<String, dynamic> json) {
    return Statement(
      date: DateTime.parse(json['date']),
      userId: json['userId'],
      description: json['description'],
      totalAmount: json['totalAmount'].toDouble(),
      paymentStatus: json['paymentStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'userId': userId,
      'description': description,
      'totalAmount': totalAmount,
      'paymentStatus': paymentStatus,
    };
  }
}
