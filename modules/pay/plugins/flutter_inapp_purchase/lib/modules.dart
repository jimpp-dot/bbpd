/// An item available for purchase from either the `Google Play Store` or `iOS AppStore`
class IAPItem {
  final String productId;
  final String price;
  final String currency;
  final String localizedPrice;
  final String title;
  final String description;
  final String introductoryPrice;

  /// ios only
  final String subscriptionPeriodNumberIOS;
  final String subscriptionPeriodUnitIOS;
  final String introductoryPricePaymentModeIOS;
  final String introductoryPriceNumberOfPeriodsIOS;
  final String introductoryPriceSubscriptionPeriodIOS;

  /// android only
  final String subscriptionPeriodAndroid;
  final String introductoryPriceCyclesAndroid;
  final String introductoryPricePeriodAndroid;
  final String freeTrialPeriodAndroid;

  /// Create [IAPItem] from a Map that was previously JSON formatted
  IAPItem.fromJSON(Map<String, dynamic> json)
      : productId = _str(json['productId']),
        price = _str(json['price']),
        currency = _str(json['currency']),
        localizedPrice = _str(json['localizedPrice']),
        title = _str(json['title']),
        description = _str(json['description']),
        introductoryPrice = _str(json['introductoryPrice']),
        introductoryPricePaymentModeIOS =
            _str(json['introductoryPricePaymentModeIOS']),
        introductoryPriceNumberOfPeriodsIOS =
            _str(json['introductoryPriceNumberOfPeriodsIOS']),
        introductoryPriceSubscriptionPeriodIOS =
            _str(json['introductoryPriceSubscriptionPeriodIOS']),
        subscriptionPeriodNumberIOS = _str(json['subscriptionPeriodNumberIOS']),
        subscriptionPeriodUnitIOS = _str(json['subscriptionPeriodUnitIOS']),
        subscriptionPeriodAndroid = _str(json['subscriptionPeriodAndroid']),
        introductoryPriceCyclesAndroid =
            _str(json['introductoryPriceCyclesAndroid']),
        introductoryPricePeriodAndroid =
            _str(json['introductoryPricePeriodAndroid']),
        freeTrialPeriodAndroid = _str(json['freeTrialPeriodAndroid']);

  /// Return the contents of this class as a string
  @override
  String toString() {
    return 'productId: $productId, '
        'price: $price, '
        'currency: $currency, '
        'localizedPrice: $localizedPrice, '
        'title: $title, '
        'description: $description, '
        'introductoryPrice: $introductoryPrice, '
        'introductoryPricePaymentModeIOS: $introductoryPrice, '
        'subscriptionPeriodNumberIOS: $subscriptionPeriodNumberIOS, '
        'subscriptionPeriodUnitIOS: $subscriptionPeriodUnitIOS, '
        'introductoryPricePaymentModeIOS: $introductoryPricePaymentModeIOS, '
        'introductoryPriceNumberOfPeriodsIOS: $introductoryPriceNumberOfPeriodsIOS, '
        'introductoryPriceSubscriptionPeriodIOS: $introductoryPriceSubscriptionPeriodIOS, '
        'subscriptionPeriodAndroid: $subscriptionPeriodAndroid, '
        'introductoryPriceCyclesAndroid: $introductoryPriceCyclesAndroid, '
        'introductoryPricePeriodAndroid: $introductoryPricePeriodAndroid, '
        'freeTrialPeriodAndroid: $freeTrialPeriodAndroid, ';
  }
}

/// An item which was purchased from either the `Google Play Store` or `iOS AppStore`
class PurchasedItem {
  final DateTime? transactionDate;
  final String transactionId;
  final String productId;
  final String transactionReceipt;
  final String purchaseToken;

  // Android only
  final bool autoRenewingAndroid;
  final String dataAndroid;
  final String signatureAndroid;

  // iOS only
  final DateTime? originalTransactionDateIOS;
  final String originalTransactionIdentifierIOS;

  /// Create [PurchasedItem] from a Map that was previously JSON formatted
  PurchasedItem.fromJSON(Map json)
      : transactionDate = _extractDate(json['transactionDate']),
        transactionId = _str(json['transactionId']),
        productId = _str(json['productId']),
        transactionReceipt = _str(json['transactionReceipt']),
        purchaseToken = _str(json['purchaseToken']),
        autoRenewingAndroid = _bool(json['autoRenewingAndroid']),
        dataAndroid = _str(json['dataAndroid']),
        signatureAndroid = _str(json['signatureAndroid']),
        originalTransactionDateIOS =
            _extractDate(json['originalTransactionDateIOS']),
        originalTransactionIdentifierIOS =
            _str(json['originalTransactionIdentifierIOS']);

  /// This returns transaction dates in ISO 8601 format.
  @override
  String toString() {
    return 'transactionDate: ${transactionDate?.toIso8601String()}, '
        'transactionId: $transactionId, '
        'productId: $productId, '
        'transactionReceipt: $transactionReceipt, '
        'purchaseToken: $purchaseToken, '
        'autoRenewingAndroid: $autoRenewingAndroid, '
        'dataAndroid: $dataAndroid, '
        'signatureAndroid: $signatureAndroid, '
        'originalTransactionDateIOS: ${originalTransactionDateIOS?.toIso8601String()}, '
        'originalTransactionIdentifierIOS: $originalTransactionIdentifierIOS';
  }

  /// Coerce miliseconds since epoch in double, int, or String into DateTime format
  static DateTime? _extractDate(dynamic timestamp) {
    if (timestamp == null) return null;

    int _toInt() => double.parse(timestamp.toString()).toInt();
    return DateTime.fromMillisecondsSinceEpoch(_toInt());
  }
}

String _str(dynamic value) {
  return value == null ? '' : value.toString();
}

bool _bool(dynamic value) {
  if (value is bool) return value;
  if (value is int) return value > 0;
  if (value is String) {
    if (value == 'true') {
      return true;
    } else if (value == 'false') {
      return false;
    }
    return _int(value) > 0;
  }

  return false;
}

int _int(dynamic value) {
  if (value == null) return 0;
  if (value is String) {
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }
  if (value is int) return value;
  if (value is double) return value.toInt();
  return 0;
}
