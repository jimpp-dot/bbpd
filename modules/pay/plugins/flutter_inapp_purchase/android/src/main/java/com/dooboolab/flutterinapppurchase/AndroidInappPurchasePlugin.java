package com.dooboolab.flutterinapppurchase;

import android.util.Base64;
import android.util.Log;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeResponseListener;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchaseHistoryRecord;
import com.android.billingclient.api.PurchaseHistoryResponseListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;
import com.dooboolab.flutterinapppurchase.core.BillingManager;
import com.dooboolab.flutterinapppurchase.core.ValueCallback;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * AndroidInappPurchasePlugin
 */
public class AndroidInappPurchasePlugin implements MethodCallHandler, BillingManager.BillingUpdatesListener {
    public static Registrar reg;
    private final String TAG = "InappPurchasePlugin";
    private Result result = null;

    private BillingManager mBillingManager;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_inapp");
        channel.setMethodCallHandler(new FlutterInappPurchasePlugin());
        reg = registrar;
    }

    @Override
    public void onMethodCall(final MethodCall call, final Result result) {
        if (call.method.equals("getPlatformVersion")) {
            try {
                result.success("Android " + android.os.Build.VERSION.RELEASE);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
        }

        else if(call.method.equals("configGIAP")){
            boolean enable = call.argument("enableVerify");
            String pk = call.argument("base64PKey");
            BillingManager.BASE_64_ENCODED_PUBLIC_KEY = pk==null?"":pk;
            BillingManager.enableVerify = enable;
            result.success("config success");
        }
        /*
         * prepare
         */
        else if (call.method.equals("prepare")) {

            if (mBillingManager != null) {
                result.success("Already started. Call endConnection method if you want to start over.");
                return;
            }
            this.result = result;
            mBillingManager = new BillingManager(reg.activity(), this);
        }

        // 是否有需要恢复购买的
        else if(call.method.equals("shouldRestore")){
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }

            this.result = result;

            mBillingManager.queryPurchases(new ValueCallback<Purchase.PurchasesResult>() {
                @Override
                public void callback(Purchase.PurchasesResult purchasesResult) {
                    if (purchasesResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        for (int i = 0; i < purchasesResult.getPurchasesList().size(); ++i) {
                            Purchase purchase = purchasesResult.getPurchasesList().get(i);
                            if(purchase != null && purchase.getPurchaseState() == Purchase.PurchaseState.PURCHASED){
                                result.success(true);
                                return;
                            }
                        }
                        result.success(false);
                    }else {
                        result.success(false);
                    }
                }
            });
        }

        else if(call.method.equals("getPurchasedItem")){
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }
            this.result = result;

            mBillingManager.queryPurchases(new ValueCallback<Purchase.PurchasesResult>() {
                @Override
                public void callback(Purchase.PurchasesResult purchasesResult) {
                    if (purchasesResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        for (int i = 0; i < purchasesResult.getPurchasesList().size(); ++i) {
                            Purchase purchase = purchasesResult.getPurchasesList().get(i);
                            if(purchase != null && purchase.getPurchaseState() == Purchase.PurchaseState.PURCHASED){
                                try {
                                    JSONObject item = new JSONObject();
                                    item.put("productId", purchase.getSku());
                                    item.put("transactionId", purchase.getOrderId());
                                    item.put("transactionDate", String.valueOf(purchase.getPurchaseTime()));
                                    item.put("transactionReceipt", getTransactionReceiptData(purchase.getOriginalJson()));
                                    item.put("dataAndroid", purchase.getOriginalJson());
                                    item.put("signatureAndroid", purchase.getSignature());
                                    item.put("purchaseToken", purchase.getPurchaseToken());
                                    item.put("autoRenewingAndroid", purchase.isAutoRenewing());
                                    result.success(item.toString());
                                } catch (JSONException e) {
                                    result.success(null);
                                }
                                return;
                            }
                        }
                        result.success(null);
                    }else {
                        result.success(null);
                    }
                }
            });
        }

        /*
         * endConnection
         */
        else if (call.method.equals("endConnection")) {
            try {
                mBillingManager.destroy();
                mBillingManager = null;
                result.success("Billing client has ended.");
            } catch (Exception e) {
                result.error(call.method, e.getMessage(), "");
            }
        }

        /*
         * consumeAllItems
         */
        else if (call.method.equals("consumeAllItems")) {
            this.result = result;
            mBillingManager.queryPurchases(new ValueCallback<Purchase.PurchasesResult>() {
                @Override
                public void callback(Purchase.PurchasesResult purchasesResult) {
                    if (purchasesResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        for (int i = 0; i < purchasesResult.getPurchasesList().size(); ++i) {
                            Purchase purchase = purchasesResult.getPurchasesList().get(i);
                            mBillingManager.consumeAsync(purchase.getPurchaseToken(),null);
                        }
                        result.success("All items have been consumed");
                    }else {
                        result.error(call.method, "unknown error", purchasesResult.getResponseCode());
                    }
                }
            });
        }

        /*
         * getItemsByType
         * arguments: type, skus
         */
        else if (call.method.equals("getItemsByType")) {
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }
            this.result = result;

            String type = call.argument("type");
            ArrayList<String> skus = call.argument("skus");


            ArrayList<String> skusList = new ArrayList<>();

            for (int i = 0; i < skus.size(); i++) {
                skusList.add(skus.get(i));
            }

            SkuDetailsParams.Builder params = SkuDetailsParams.newBuilder();
            params.setSkusList(skusList).setType(type);
            mBillingManager.querySkuDetailsAsync(type, skusList,
                    new SkuDetailsResponseListener() {
                        @Override
                        public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> skuDetailsList) {
                            JSONArray items = new JSONArray();
                            if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                                try {
                                    for (SkuDetails skuDetails : skuDetailsList) {
                                        JSONObject item = new JSONObject();
                                        item.put("productId", skuDetails.getSku());
                                        item.put("price", String.format(Locale.ENGLISH, "%.02f",
                                                skuDetails.getPriceAmountMicros() / 1000000f));
                                        item.put("currency", skuDetails.getPriceCurrencyCode());
                                        item.put("type", skuDetails.getType());
                                        item.put("localizedPrice", skuDetails.getPrice());
                                        item.put("title", skuDetails.getTitle());
                                        item.put("icon", skuDetails.getIconUrl());
                                        item.put("description", skuDetails.getDescription());
                                        item.put("introductoryPrice", skuDetails.getIntroductoryPrice());
                                        item.put("subscriptionPeriodAndroid", skuDetails.getSubscriptionPeriod());
                                        item.put("freeTrialPeriodAndroid", skuDetails.getFreeTrialPeriod());
                                        item.put("introductoryPriceCyclesAndroid", skuDetails.getIntroductoryPriceCycles());
                                        item.put("introductoryPricePeriodAndroid", skuDetails.getIntroductoryPricePeriod());
                                        items.put(item);
                                    }
                                } catch (JSONException e) {
                                    result.error(TAG, "E_BILLING_RESPONSE_JSON_PARSE_ERROR", e.getMessage());
                                }
                                result.success(items.toString());
                            } else {
                                result.error(TAG, call.method, "Billing response is not ok");
                            }
                        }
                    }
            );
        }

        /*
         * getAvailableItemsByType
         * arguments: type
         */
        else if (call.method.equals("getAvailableItemsByType")) {
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }
            this.result = result;
            final String type = call.argument("type");
            final JSONArray items = new JSONArray();

            mBillingManager.queryPurchases(type, new ValueCallback<Purchase.PurchasesResult>() {
                @Override
                public void callback(Purchase.PurchasesResult purchasesResult) {
                    List<Purchase> purchases = purchasesResult.getPurchasesList();
                    int code = purchasesResult.getResponseCode();
                    if(code == BillingClient.BillingResponseCode.OK && purchases != null){
                        for(Purchase purchase : purchases){
                            try {
                                JSONObject item = new JSONObject();
                                item.put("productId", purchase.getSku());
                                item.put("transactionId", purchase.getOrderId());
                                item.put("transactionDate", purchase.getPurchaseTime());
                                item.put("transactionReceipt", getTransactionReceiptData(purchase.getOriginalJson()));
                                item.put("dataAndroid", purchase.getOriginalJson());
                                item.put("signatureAndroid", purchase.getSignature());
                                item.put("purchaseToken", purchase.getPurchaseToken());

                                if (type.equals(BillingClient.SkuType.SUBS)) {
                                    item.put("autoRenewingAndroid", purchase.isAutoRenewing());
                                }
                                items.put(item);
                            } catch (JSONException e) {
                                result.error(TAG, "E_BILLING_RESPONSE_JSON_PARSE_ERROR", e.getMessage());
                            }
                        }
                        result.success(items.toString());
                    }
                    result.error(TAG, "errorCode", code);
                }
            });
        }

        /*
         * getPurchaseHistoryByType
         * arguments: type
         */
        else if (call.method.equals("getPurchaseHistoryByType")) {
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }
            this.result = result;

            final String type = call.argument("type");

            mBillingManager.queryPurchaseHistoryAsync(type, new PurchaseHistoryResponseListener() {
                @Override
                public void onPurchaseHistoryResponse(BillingResult billingResult, List<PurchaseHistoryRecord> purchaseHistoryRecordList) {
                    Log.d(TAG, "responseCode: " + billingResult.getResponseCode());

                    if (purchaseHistoryRecordList != null && billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        JSONArray items = new JSONArray();
                        try {
                            for (PurchaseHistoryRecord purchase : purchaseHistoryRecordList) {
                                JSONObject item = new JSONObject();
                                item.put("productId", purchase.getSku());
                                item.put("transactionDate", String.valueOf(purchase.getPurchaseTime()));
                                item.put("transactionReceipt", getTransactionReceiptData(purchase.getOriginalJson()));
                                item.put("purchaseToken", purchase.getPurchaseToken());
                                item.put("dataAndroid", purchase.getOriginalJson());
                                item.put("signatureAndroid", purchase.getSignature());
                                items.put(item);
                            }
                        } catch (JSONException je) {
                            result.error(TAG, "JSON_PARSE_ERROR", je.getMessage());
                        }
                        result.success(items.toString());
                    } else {
                        result.error(TAG, "getAvailableItemsByType", "billingResponse is not ok: " +
                                billingResult.getResponseCode());
                    }
                }
            });
        }

        /*
         * buyItemByType
         * arguments: type, sku, oldSku
         */
        else if (call.method.equals("buyItemByType")) {
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }

            final String type = call.argument("type");
            final String sku = call.argument("sku");
            final String oldSku = call.argument("oldSku");

            final BillingFlowParams.Builder builder = BillingFlowParams.newBuilder();

            if (type.equals(BillingClient.SkuType.SUBS) && oldSku != null && !oldSku.isEmpty()) {
                builder.setOldSku(oldSku);
            }

            this.result = result;

            mBillingManager.querySkuDetailsAsync(type, Arrays.asList(sku), new SkuDetailsResponseListener() {
                @Override
                public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> skuDetailsList) {
                    if(billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK &&
                        skuDetailsList != null && skuDetailsList.size() > 0){
                        mBillingManager.initiatePurchaseFlow(skuDetailsList.get(0),oldSku);
                    }else {
                        result.error(TAG,"unknown error",billingResult.getResponseCode());
                    }
                }
            });
        }

        /*
         * consumeProduct
         * arguments: type
         */
        else if (call.method.equals("consumeProduct")) {
            if (mBillingManager == null) {
                result.error(call.method, "IAP not prepared. Check if Google Play service is available.", "");
                return;
            }
            this.result = result;

            final String token = call.argument("token");

            mBillingManager.consumeAsync(token, new ConsumeResponseListener() {
                @Override
                public void onConsumeResponse(BillingResult billingResult, String purchaseToken) {
                    if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                        result.success("Consumed: " + billingResult.getResponseCode());
                    } else {
                        result.error(TAG, "consumeProduct", "consumeResponse is not ok: " + billingResult.getResponseCode());
                    }
                }
            });
        }

        /*
         * else
         */
        else {
            result.notImplemented();
        }
    }


    @Override
    public void onBillingClientSetupFinished(boolean ready) {
        if (result != null) {
            if(ready)result.success("Billing client ready");
            else result.error(TAG,"not support in-app billing",ready);
            result = null;
        }
    }

    @Override
    public void onConsumeFinished(String token, int result) {
    }

    @Override
    public void onPurchasesUpdated(int code,List<Purchase> purchases) {
        if (result != null) {
            switch (code) {
                case BillingClient.BillingResponseCode.OK:
                    if(purchases != null && purchases.size() > 0){
                        for (Purchase purchase : purchases) {
                            try {
                                JSONObject item = new JSONObject();
                                item.put("productId", purchase.getSku());
                                item.put("transactionId", purchase.getOrderId());
                                item.put("transactionDate", String.valueOf(purchase.getPurchaseTime()));
                                item.put("transactionReceipt", getTransactionReceiptData(purchase.getOriginalJson()));
                                item.put("dataAndroid", purchase.getOriginalJson());
                                item.put("signatureAndroid", purchase.getSignature());
                                item.put("purchaseToken", purchase.getPurchaseToken());
                                item.put("autoRenewingAndroid", purchase.isAutoRenewing());
                                result.success(item.toString());
                                break;
                            } catch (JSONException e) {
                                result.error(TAG, "E_BILLING_RESPONSE_JSON_PARSE_ERROR", e.getMessage());
                            }
                        }
                    }else result.error(TAG,"unknown error",code);
                    break;
                case BillingClient.BillingResponseCode.USER_CANCELED:
                    result.error(TAG,"user cancelled the purchase",code);
                    break;
                default:
                    result.error(TAG,"unknown error",code);
                    break;
            }
           result = null;
        }
    }

    private String getTransactionReceiptData(String rawData){
        return Base64.encodeToString(rawData.getBytes(Charset.forName("UTF-8")), Base64.NO_WRAP);
    }
}
