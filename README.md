# flutter_authorize_net_client

[![pub package](https://img.shields.io/pub/v/flutter_authorize_net_client.svg)](https://pub.dev/packages/flutter_authorize_net_client)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This is a simple flutter plugin allow using [authorize.net](https://authorize.net) using its unique API approach.

This plugin is implemented using very simple methods & models to integrate the authorize.net API.

Please refer to the developer api references for more details:
https://developer.authorize.net/api/reference

**Note**:

Only a limited set of operations are supported for now.
Also, all the transactions are Credit card based transactions only.


### Supported Operations:
- Testing Authentication of the client using credentials
    - Reference: https://developer.authorize.net/api/reference/index.html#gettingstarted-section-section-header
- Charge a credit card
    - Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-charge-a-credit-card
- Create an authorized payment for future transaction
    - https://developer.authorize.net/api/reference/index.html#payment-transactions-authorize-a-credit-card
- execute pre-authorized payment transaction
    - Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-capture-funds-authorized-through-another-channel
- void an existing authorized transaction
    - Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-void-a-transaction

### Install plugin:
Visit https://pub.dev/packages/flutter_authorize_net_client#-installing-tab-

### Import library:
```dart
import 'package:flutter_authorize_net_client/flutter_authorize_net_client.dart';
```

## Usage Examples:

### Create Client instance:
```dart
final _client = AuthorizeNetClient('MERCHANT_NAME', 'TRANSACTION_KEY');
```

### Test Authentication:
```dart

    final response = await _client.authenticationTest();
    print('isSuccessFul: ${response.isSuccessful}');

```

### Charge a credit card:
```dart

    final response = await _client.chargeCreditCard(
      '5',
      'USD'.toLowerCase(),
      '5424000000000015',
      '2022-12',
      '123',
    );
    print('isSuccessFul: ${response.isSuccessful}');
```

### Pre-Authorize payment:
```dart

    final response = await _client.authorizeCardPayment(
        '5',
        'USD'.toLowerCase(),
        '5424000000000015',
        '2022-12',
        '123',
    );

    print('isSuccessFul: ${response.isSuccessful}');
    // keep a reference to transactionID in memory for future use
    _refID = response?.transactionResponse?.transId;

```

### Execute Pre-Authorize payment:
```dart

    final response = await _client.priorAuthCaptureTransaction(
        '5',
        'USD'.toLowerCase(),
        '5424000000000015',
        '2022-12',
        '123',
    );

   print('isSuccessFul: ${response.isSuccessful}');
    // keep a reference to transactionID in memory for future use
    _refID = response?.transactionResponse?.transId;

```

### Void payment:
```dart

    final response = await _client.voidTransaction(_refID);
    print('isSuccessFul: ${response.isSuccessful}');

```


**Some notes regarding API parameters**:
- Currency must be in [ISO-4217](https://en.wikipedia.org/wiki/ISO_4217) format
    -  Value must be passed in lowercase,
	i.e `usd` instead of `USD`, `gbp` instead of `GBP`, `eur` instead of `EUR`, etc
    - Currency symbols are not supported
- Amount can be a decimal value
    - Up to 15 digits with a decimal point
    - This is the total amount and must include tax, shipping, tips, and any other charges.

## Contribution/Support
- File an issue on the repository, if something is not working as expected.
   - Please follow the issue template used in flutter-sdk's repository, may be we'll integrate that here as well.
- File an issue in the repository, If you have any suggestions and/or feature requests, use `[Suggestion]` or `[FeatureRequest]` tags in issue titles.
- To support you just have to help out fellow developers on of the filed issues in this repository.
- To contribute, just follow the standard open source contributions instructions, maybe we can follow the ones used in the flutter sdk. We'll see how it goes.

