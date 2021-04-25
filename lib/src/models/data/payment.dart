import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import 'credit_card.dart';

part 'payment.g.dart';

/// A model to represent payment data, currently it only supports Credit card data
@JsonSerializable(explicitToJson: true)
class Payment {
  @JsonKey(name: 'creditCard')
  final CreditCard creditCard;

  Payment({this.creditCard});

  factory Payment.creditCard(
    String cardNumber,
    String expirationDate,
    String cardCode,
  ) {
    return Payment(
      creditCard: CreditCard(
        cardNumber: cardNumber,
        expirationDate: expirationDate,
        cardCode: cardCode,
      ),
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => removeNullsFromMap(_$PaymentToJson(this));
}

/*{
    "creditCard": {
        "cardNumber": "5424000000000015",
        "expirationDate": "2020-12",
        "cardCode": "999"
    }
}*/
