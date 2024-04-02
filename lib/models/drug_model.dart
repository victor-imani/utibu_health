class Drug {
  int id;
  String medicationName;
  String type;
  int quantity;
  double pricePerUnit;

  Drug({
    required this.id,
    required this.medicationName,
    required this.type,
    required this.quantity,
    required this.pricePerUnit,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      id: json['id'] ?? 0,
      medicationName: json['name'] ?? '',
      type: json['type'] ?? '',
      quantity: json['quantity'] ?? 0,
      pricePerUnit: json['price_per_unit'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': medicationName,
      'type': type,
      'quantity': quantity,
      'price_per_unit': pricePerUnit,
    };
  }
   @override
  String toString() {
    return 'Drug{id: $id, medicationName: $medicationName, type: $type, quantity: $quantity, pricePerUnit: $pricePerUnit}';
  }
}
