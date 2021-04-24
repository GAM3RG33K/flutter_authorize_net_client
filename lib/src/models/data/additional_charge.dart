import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'additional_charge.g.dart';

@JsonSerializable(explicitToJson: true)
class AdditionalCharge {
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;

  AdditionalCharge(this.amount, this.name, this.description);

  factory AdditionalCharge.fromJson(Map<String, dynamic> json) =>
      _$AdditionalChargeFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$AdditionalChargeToJson(this));
}

/*{
      "amount": "4.26",
      "name": "level2 tax name",
      "description": "level2 tax"
  }*/
