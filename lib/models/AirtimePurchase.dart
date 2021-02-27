class AirtimePurchase{
  final String code;
  final int amount;
  final String phoneNumber;

  AirtimePurchase({this.code, this.amount, this.phoneNumber});

  factory AirtimePurchase.fromJson(Map<String, dynamic>json){
    if (json == null) return null;
    return AirtimePurchase(
      code: json['Code'],
      amount: json['Amount'],
      phoneNumber: json['PhoneNumber'],
    );
  }

  // static AirtimePurchase fromMap(String source) => AirtimePurchase.fromJson(json.decode(source));
}

