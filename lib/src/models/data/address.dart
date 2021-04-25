import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'address.g.dart';

/// A model to represent address used for shipping & billing purpose
@JsonSerializable(explicitToJson: true)
class Address {
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'company')
  final String company;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'zip')
  final String zip;
  @JsonKey(name: 'country')
  final String country;

  Address(this.firstName, this.lastName, this.company, this.address, this.city,
      this.state, this.zip, this.country);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => removeNullsFromMap(_$AddressToJson(this));
}

/*{
    "firstName": "Ellen",
    "lastName": "Johnson",
    "company": "Souveniropolis",
    "address": "14 Main Street",
    "city": "Pecan Springs",
    "state": "TX",
    "zip": "44628",
    "country": "US"
}*/
