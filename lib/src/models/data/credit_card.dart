import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'credit_card.g.dart';

/// A model to represent credit card data used for payment
@JsonSerializable(explicitToJson: true)
class CreditCard {
  @JsonKey(name: 'cardNumber')
  final String cardNumber;
  @JsonKey(name: 'expirationDate')
  final String expirationDate; // yyyy-MM format only
  @JsonKey(name: 'cardCode')
  final String cardCode;

  CreditCard({this.cardNumber, this.expirationDate, this.cardCode});

  factory CreditCard.fromJson(Map<String, dynamic> json) =>
      _$CreditCardFromJson(json);

  Map<String, dynamic> toJson() => removeNullsFromMap(_$CreditCardToJson(this));
}

/*{
        "cardNumber": "5424000000000015",
        "expirationDate": "2020-12",
        "cardCode": "999"
    }*/
