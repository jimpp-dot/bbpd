import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

import 'utils.dart';
import 'modules.dart';

export 'modules.dart';

class FlutterInappPurchase {
  /// A list-based enumeration of in-app purchase types
  static final List<String> _typeInApp = [
    'inapp',
    'subs',
  ];

  /// Defining the [MethodChannel] for Flutter_Inapp_Purchase
  static const MethodChannel _channel = MethodChannel('flutter_inapp');

  static const EventChannel _eventChannel = EventChannel('inapp.message');
  static Stream<dynamic>? _onMessageReceived;

  static Stream<dynamic> get onMessageReceived {
    if (_onMessageReceived == null) {
      _onMessageReceived = _eventChannel.receiveBroadcastStream();
    }
    return _onMessageReceived!;
  }

  /// Returns the platform version on `Android` and `iOS`.
  ///
  /// eg, `Android 5.1.1`
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Consumes all items on `Android`.
  ///
  /// Particularly useful for removing all consumable items.
  static Future<String?> get consumeAllItems async {
    if (Platform.isAndroid) {
      final String? result = await _channel.invokeMethod('consumeAllItems');
      return result;
    } else if (Platform.isIOS) {
      return 'no-ops in ios';
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Prepares `Android` to purchase items.
  ///
  /// Must be called on `Android` before purchasing.
  /// On `iOS` this just checks if the client can make payments.
  @deprecated
  static Future<String?> get prepare async {
    if (Platform.isAndroid) {
      final String? result = await _channel.invokeMethod('prepare');
      return result;
    } else if (Platform.isIOS) {
      final String? result = await _channel.invokeMethod('canMakePayments');
      return result;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// InitConnection `Android` to purchase items.
  ///
  /// Must be called on `Android` before purchasing.
  /// On `iOS` this just checks if the client can make payments.
  static Future<String?> get initConnection async {
    if (Platform.isAndroid) {
      final String? result = await _channel.invokeMethod('prepare');
      return result;
    } else if (Platform.isIOS) {
      final String? result = await _channel.invokeMethod('canMakePayments');
      return result;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  static void configGIAP(bool enableVerify, {String? base64PKey}) async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod<String>('configGIAP',
          {'enableVerify': enableVerify, 'base64PKey': base64PKey});
    }
  }

  /// Retrieves a list of products from the store on `Android` and `iOS`.
  ///
  /// `iOS` also returns subscriptions.
  static Future<List<IAPItem>> getProducts(List<String?>? skus) async {
    if (skus == null || skus.contains(null)) return [];
    skus = skus.toList();
    if (Platform.isAndroid) {
      String? result = await _channel.invokeMethod(
        'getItemsByType',
        {
          'type': _typeInApp[0],
          'skus': skus,
        },
      );

      return extractItems(result);
    } else if (Platform.isIOS) {
      dynamic result = await _channel.invokeMethod<dynamic>(
        'getItems',
        {
          'skus': skus,
        },
      );

      if (result is PlatformException) {
        throw result;
      } else {
        return extractItems(json.encode(result));
      }
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Retrieves subscriptions on `Android` and `iOS`.
  ///
  /// `iOS` also returns non-subscription products.
  // static Future<List<IAPItem>> getSubscriptions(List<String> skus) async {
  //   if (skus == null || skus.contains(null)) return [];
  //   skus = skus.toList();
  //   if (Platform.isAndroid) {
  //     String result = await _channel.invokeMethod(
  //       'getItemsByType',
  //       {
  //         'type': _typeInApp[1],
  //         'skus': skus,
  //       },
  //     );

  //     return extractItems(result);
  //   } else if (Platform.isIOS) {
  //     dynamic result = await _channel.invokeMethod<dynamic>(
  //       'getItems',
  //       {
  //         'skus': skus,
  //       },
  //     );

  //     return extractItems(json.encode(result));
  //   }
  //   throw PlatformException(code: Platform.operatingSystem, message: "platform not supported");
  // }

  /// Retrieves the user's purchase history on `Android` and `iOS` regardless of consumption status.
  ///
  /// Purchase history includes all types of products.
  /// Identical to [getAvailablePurchases] on `iOS`.
  static Future<List<PurchasedItem>> getPurchaseHistory() async {
    if (Platform.isAndroid) {
      dynamic result1 = await _channel.invokeMethod<dynamic>(
        'getPurchaseHistoryByType',
        <String, dynamic>{
          'type': _typeInApp[0],
        },
      );

      dynamic result2 = await _channel.invokeMethod<dynamic>(
        'getPurchaseHistoryByType',
        <String, dynamic>{
          'type': _typeInApp[1],
        },
      );

      return extractPurchased(result1) + extractPurchased(result2);
    } else if (Platform.isIOS) {
      dynamic result =
          await _channel.invokeMethod<dynamic>('getAvailableItems');

      return extractPurchased(json.encode(result));
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Get all non-consumed purchases made on `Android` and `iOS`.
  ///
  /// This is identical to [getPurchaseHistory] on `iOS`
  static Future<List<PurchasedItem>> getAvailablePurchases() async {
    if (Platform.isAndroid) {
      dynamic result1 = await _channel.invokeMethod<dynamic>(
        'getAvailableItemsByType',
        <String, dynamic>{
          'type': _typeInApp[0],
        },
      );

      dynamic result2 = await _channel.invokeMethod<dynamic>(
        'getAvailableItemsByType',
        <String, dynamic>{
          'type': _typeInApp[1],
        },
      );

      return extractPurchased(result1) + extractPurchased(result2);
    } else if (Platform.isIOS) {
      dynamic result =
          await _channel.invokeMethod<dynamic>('getAvailableItems');

      return extractPurchased(json.encode(result));
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  // 返回iOS本地收据的base64 字符串
  static Future<String?> getReceiptData() async {
    if (Platform.isAndroid) {
      return null;
    } else if (Platform.isIOS) {
      dynamic result = await _channel.invokeMethod<dynamic>('getReceiptData');
      if (result is PlatformException) {
        throw result;
      } else {
        return result.toString();
      }
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  static Future<String?> restoreCompletedTransactions() async {
    if (Platform.isAndroid) {
      return null;
    } else if (Platform.isIOS) {
      dynamic result =
          await _channel.invokeMethod<dynamic>('restoreCompletedTransactions');
      return result.toString();
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  // 返回Android本地收据的base64 字符串
  static Future<PurchasedItem?> getPurchasedItem() async {
    if (Platform.isAndroid) {
      String? result = await _channel.invokeMethod<String>('getPurchasedItem');
      if (result == null) return null;
      Map param = json.decode(result.toString()) as Map;
      PurchasedItem item = PurchasedItem.fromJSON(param);
      return item;
    } else if (Platform.isIOS) {
      return null;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  static Future<bool?> shouldRestore() async {
    if (Platform.isAndroid || Platform.isIOS) {
      bool? result = await _channel.invokeMethod('shouldRestore');
      return result;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Purchase a product on `Android` or `iOS`.
  ///
  /// Identical to [buySubscription] on `iOS`.
  static Future<PurchasedItem> buyProduct(String sku) async {
    if (Platform.isAndroid) {
      String? result = await _channel
          .invokeMethod<String>('buyItemByType', <String, dynamic>{
        'type': _typeInApp[0],
        'sku': sku,
        'oldSku': null, //TODO can this be removed?
      });

      Map param = json.decode(result.toString()) as Map;
      PurchasedItem item = PurchasedItem.fromJSON(param);
      return item;
    } else if (Platform.isIOS) {
      dynamic result = await _channel.invokeMethod<dynamic>(
          'buyProductWithFinishTransaction', <String, dynamic>{
        'sku': sku,
      });
      if (result is PlatformException) {
        throw result;
      } else {
        result = json.encode(result);
        Map<String, dynamic> param =
            json.decode(result.toString()) as Map<String, dynamic>;
        PurchasedItem item = PurchasedItem.fromJSON(param);
        return item;
      }
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Purchase a subscription on `Android` or `iOS`.
  ///
  /// **NOTICE** second parameter is required on `Android`.
  ///
  /// Identical to [buyProduct] on `iOS`.
  static Future<PurchasedItem> buySubscription(String sku,
      {String? oldSku}) async {
    if (Platform.isAndroid) {
      dynamic result = await _channel
          .invokeMethod<dynamic>('buyItemByType', <String, dynamic>{
        'type': _typeInApp[1],
        'sku': sku,
        'oldSku': oldSku,
      });

      Map<String, dynamic> param =
          json.decode(result.toString()) as Map<String, dynamic>;
      PurchasedItem item = PurchasedItem.fromJSON(param);
      return item;
    } else if (Platform.isIOS) {
      dynamic result = await _channel.invokeMethod<dynamic>(
          'buyProductWithFinishTransaction', <String, dynamic>{
        'sku': sku,
      });
      result = json.encode(result);

      Map<String, dynamic> param =
          json.decode(result.toString()) as Map<String, dynamic>;
      PurchasedItem item = PurchasedItem.fromJSON(param);
      return item;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Consumes a purchase on `Android`.
  ///
  /// No effect on `iOS`, whose consumable purchases are consumed at the time of purchase.
  static Future<String?> consumePurchase(String token) async {
    if (Platform.isAndroid) {
      String? result =
          await _channel.invokeMethod('consumeProduct', <String, dynamic>{
        'token': token,
      });

      return result;
    } else if (Platform.isIOS) {
      return 'no-ops in ios';
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// End Play Store connection on `Android`.
  ///
  /// Absolutely necessary to call this when done with the Play Store.
  ///
  /// No effect on `iOS`, whose store connection is always available.
  static Future<String?> get endConnection async {
    if (Platform.isAndroid) {
      final String? result = await _channel.invokeMethod('endConnection');
      return result;
    } else if (Platform.isIOS) {
      return 'no-ops in ios';
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Buy a product without finishing the transaction on `iOS`.
  ///
  /// This allows you to perform server-side validation before finalizing the transaction on screen.
  ///
  /// No effect on `Android`, who does not allow this type of functionality.
  static Future<PurchasedItem> buyProductWithoutFinishTransaction(
      String sku) async {
    if (Platform.isAndroid) {
      dynamic result = await _channel
          .invokeMethod<dynamic>('buyItemByType', <String, dynamic>{
        'type': _typeInApp[0],
        'sku': sku,
        'oldSku': null,
      });
      if (result is PlatformException) {
        throw result;
      } else {
        Map param = json.decode(result.toString()) as Map;
        PurchasedItem item = PurchasedItem.fromJSON(param);
        return item;
      }
    } else if (Platform.isIOS) {
      dynamic result = await _channel.invokeMethod<dynamic>(
          'buyProductWithoutFinishTransaction', <String, dynamic>{
        'sku': sku,
      });
      if (result is PlatformException) {
        throw result;
      } else {
        Map<String, dynamic> map = <String, dynamic>{
          'transactionReceipt': result is String ? result : ''
        };
        PurchasedItem item = PurchasedItem.fromJSON(map);
        return item;
      }
    }

    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Finish a transaction on `iOS`.
  ///
  /// Call this after finalizing server-side validation of the reciept.
  ///
  /// No effect on `Android`, who does not allow this type of functionality.
  static Future<String?> finishTransaction([String? transactionId]) async {
    if (Platform.isAndroid) {
      return 'no-ops in android.';
    } else if (Platform.isIOS) {
      String? result = await _channel.invokeMethod(
          'finishTransaction', {'transactionId': transactionId ?? ''});
      return result;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  static Future<String?> finishAllTransaction() async {
    if (Platform.isAndroid) {
      return 'no-ops in android.';
    } else if (Platform.isIOS) {
      String? result = await _channel.invokeMethod('finishAllTransaction');
      return result;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Retrieves a list of products that have been attempted to purchase through the App Store `iOS` only.
  ///
  static Future<List<IAPItem>> getAppStoreInitiatedProducts() async {
    if (Platform.isAndroid) {
      return <IAPItem>[];
    } else if (Platform.isIOS) {
      dynamic result =
          await _channel.invokeMethod<dynamic>('getAppStoreInitiatedProducts');

      return extractItems(json.encode(result));
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Check if a subscription is active on `Android` and `iOS`.
  ///
  /// This is a quick and dirty way to check if a subscription is active.
  /// It is highly recommended to do server-side validation for all subscriptions.
  /// This method is NOT secure and untested in production.
  static Future<bool> checkSubscribed({
    String? sku,
    Duration duration = const Duration(days: 30),
    Duration grace = const Duration(days: 3),
  }) async {
    if (Platform.isIOS) {
      var history = await FlutterInappPurchase.getPurchaseHistory();

      for (var purchase in history) {
        Duration difference =
            DateTime.now().difference(purchase.transactionDate!);
        if (difference.inMinutes <= (duration + grace).inMinutes &&
            purchase.productId == sku) return true;
      }

      return false;
    } else if (Platform.isAndroid) {
      var purchases = await FlutterInappPurchase.getAvailablePurchases();

      for (var purchase in purchases) {
        if (purchase.productId == sku) return true;
      }

      return false;
    }
    throw PlatformException(
        code: Platform.operatingSystem, message: "platform not supported");
  }

  /// Validate receipt in ios
  ///
  /// Example:
  /// ```
  /// const receiptBody = {
  /// 'receipt-data': purchased.transactionReceipt,
  /// 'password': '******'
  /// };
  /// const result = await validateReceiptIos(receiptBody, false);
  /// console.log(result);
  /// ```
  static Future<http.Response> validateReceiptIos({
    required Map<String, String> receiptBody,
    bool isTest = true,
  }) async {
    final String url = isTest
        ? 'https://sandbox.itunes.apple.com/verifyReceipt'
        : 'https://buy.itunes.apple.com/verifyReceipt';
    return await http.post(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(receiptBody),
    );
  }

  /// Validate receipt in android
  ///
  /// For Android, you need separate json file from the service account to get the access_token from google-apis, therefore it is impossible to implement serverless. You should have your own backend and get access_token.
  /// Read: https://stackoverflow.com/questions/35127086/android-inapp-purchase-receipt-validation-google-play?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
  ///
  /// Example:
  /// ```
  /// const result = await validateReceiptAndroid(
  ///   packageName: 'com.dooboolab.iap',
  ///   productId: 'product_1',
  ///   productToken: 'some_token_string',
  ///   accessToken: 'play_console_access_token',
  ///   isSubscription: false,
  /// );
  /// console.log(result);
  /// ```
  static Future<http.Response> validateReceiptAndroid({
    required String packageName,
    required String productId,
    required String productToken,
    required String accessToken,
    bool isSubscription = false,
  }) async {
    final String type = isSubscription ? 'subscriptions' : 'products';
    final String url =
        'https://www.googleapis.com/androidpublisher/v2/applications/$packageName/purchases/$type/$productId/tokens/$productToken?access_token=$accessToken';
    return await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
      },
    );
  }
}
