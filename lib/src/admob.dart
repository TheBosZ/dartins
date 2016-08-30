@JS()
library AdMob;

import 'package:js/js.dart';
import 'dart:async';

class AdMob {
	static Future setOptions(AdMobOptions options) {
		Completer c = new Completer();
		AdMobApi.setOptions(options, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future createBannerView(AdMobOptions options){
		Completer c = new Completer();
		AdMobApi.createBannerView(options, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future showBannerAd(bool show){
		Completer c = new Completer();
		AdMobApi.showBannerAd(show, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future destroyBannerView(){
		Completer c = new Completer();
		AdMobApi.destroyBannerView(allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future requestInterstitialAd(AdMobOptions options){
		Completer c = new Completer();
		AdMobApi.requestInterstitialAd(options, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future showInterstitialAd(){
		Completer c = new Completer();
		AdMobApi.showInterstitialAd(allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future recordResolution(int purchaseId, int resolution){
		Completer c = new Completer();
		AdMobApi.recordResolution(purchaseId, resolution, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future recordPlayBillingResolution(int purchaseId, int billingResponseCode){
		Completer c = new Completer();
		AdMobApi.recordPlayBillingResolution(purchaseId, billingResponseCode, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}
}

@JS('admob')
class AdMobApi {
	external static setOptions(AdMobOptions options, [Function success, Function error]);

	external static createBannerView(AdMobOptions options, [Function success = null, Function error = null]);

	external static showBannerAd(bool show, [Function success = null, Function error = null]);

	external static destroyBannerView([Function success = null, Function error = null]);

	external static requestInterstitialAd(AdMobOptions options, [Function success = null, Function error = null]);

	external static showInterstitialAd([Function success = null, Function error = null]);

	external static recordResolution(int purchaseId, int resolution, [Function success = null, Function error = null]);

	external static recordPlayBillingResolution(int purchaseId, int billingResponseCode, [Function success = null, Function error = null]);

	static const String onAdLoaded = 'appfeel.cordova.admob.onAdLoaded';
	static const String onAdFailedToLoad = "appfeel.cordova.admob.onAdFailedToLoad";
	static const String onAdOpened = "appfeel.cordova.admob.onAdOpened";
	static const String onAdLeftApplication = "appfeel.cordova.admob.onAdLeftApplication";
	static const String onAdClosed = "appfeel.cordova.admob.onAdClosed";
	static const String onInAppPurchaseRequested = "appfeel.cordova.admob.onInAppPurchaseRequested";

	static const String AD_SIZE_BANNER = 'BANNER';
	static const String AD_SIZE_IAB_MRECT = 'IAB_MRECT';
	static const String AD_SIZE_IAB_BANNER = 'IAB_BANNER';
	static const String AD_SIZE_IAB_LEADERBOARD = 'IAB_LEADERBOARD';
	static const String AD_SIZE_SMART_BANNER = 'SMART_BANNER';

	static const String AD_TYPE_BANNER = 'banner';
	static const String AD_TYPE_INTERSTITIAL = 'interstitial';

	static const int PURCHASE_RESOLUTION_RESOLUTION_CANCELED = 2;
	static const int PURCHASE_RESOLUTION_RESOLUTION_FAILURE = 0;
	static const int PURCHASE_RESOLUTION_RESOLUTION_INVALID_PRODUCT = 3;
	static const int PURCHASE_RESOLUTION_RESOLUTION_SUCCESS = 1;
}



@JS()
@anonymous
class AdMobOptions {

	external String get publisherId;
	external set publisherId(String v);

	external String get interstitialAdId;
	external set interstitialAdId(String v);

	external String get adSize;
	external set adSize(String v);

	external bool get bannerAtTop;
	external set bannerAtTop(bool v);

	external bool get overlap;
	external set overlap(bool v);

	external bool get offsetStatusBar;
	external set offsetStatusBar(bool v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get autoShowBanner;
	external set autoShowBanner(bool v);

	external bool get autoShowInterstitial;
	external set autoShowInterstitial(bool v);

	external factory AdMobOptions({
		String publisherId,
		String interstitialAdId,
		String adSize: AdMobApi.AD_SIZE_SMART_BANNER,
		bool bannerAtTop: false,
		bool overlap: false,
		bool offsetStatusBar: false,
		bool isTesting: false,
		bool autoShowBanner: true,
		bool autoShowInterstitial: true
	});
}
