library amazon_ads;

import 'amazon_mobile_ads.dart';
import 'dart:async';
import 'package:js/js.dart';

class AmazonAds {

	static const String DOCK_TOP = 'TOP';
	static const String DOCK_BOTTOM = 'BOTTOM';

	static const String ALIGN_LEFT = 'LEFT';
	static const String ALIGN_RIGHT = 'RIGHT';
	static const String ALIGN_CENTER = 'CENTER';

	static const String FIT_SCREEN_WIDTH = 'FIT_SCREEN_WIDTH';
	static const String FIT_AD_SIZE = 'FIT_AD_SIZE';

	static const String EVENT_AD_COLLAPSED = 'adCollapsed';
	static const String EVENT_AD_DISMISSED = 'adDismissed';
	static const String EVENT_AD_EXPANDED = 'adExpanded';
	static const String EVENT_AD_FAILED_TO_LOAD = 'adFailedToLoad';
	static const String EVENT_AD_LOADED = 'adLoaded';
	static const String EVENT_AD_RESIZED = 'adResized';

	static Future setApplicationKey(String key) {
		var completer = new Completer();
		AmazonMobileAds.setApplicationKey(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ApplicationKey(stringValue: key)]);
		return completer.future;
	}

	static Future registerApplication() {
		var completer = new Completer();
		AmazonMobileAds.registerApplication(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future enableLogging([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableLogging(allowInterop((var res) {
			completer.complete(res);
		}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future enableTesting([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableTesting(allowInterop((var res) {
			completer.complete(res);
		}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future enableGeoLocation([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableGeoLocation(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future createFloatingBannerAd(
		{String dock, String horizontalAlign, String adFit}) {
		var completer = new Completer();
		AmazonMobileAds.createFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [new Placement(
			dock: dock, adFit: adFit, horizontalAlign: horizontalAlign)
		]);
		return completer.future;
	}

	static Future createInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.createInterstitialAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future loadAndShowFloatingBannerAd(Ad ad) {
		var completer = new Completer();
		AmazonMobileAds.loadAndShowFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [ad]);
		return completer.future;
	}

	static Future loadInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.loadInterstitialAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future showInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.showInterstitialAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future closeFloatingBannerAd(Ad ad) {
		var completer = new Completer();
		AmazonMobileAds.closeFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [ad]);
		return completer.future;
	}

	static Future<bool> isInterstitialAdReady() {
		var completer = new Completer();
		AmazonMobileAds.isInterstitialAdReady(
			allowInterop((var ready) =>
				completer.complete(ready.booleanValue)),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future<bool> areAdsEqual(Ad adOne, Ad adTwo) {
		var completer = new Completer();
		AmazonMobileAds.areAdsEqual(
			allowInterop((var isEqual) =>
				completer.complete(isEqual.booleanValue)),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new AdPair(adOne: adOne, adTwo: adTwo)]);
		return completer.future;
	}

	static void addListener(String event, Function s) {
		AmazonMobileAds.addListener(event, allowInterop(s));
	}
}
