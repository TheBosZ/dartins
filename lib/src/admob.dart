@JS()
library AdMob;

import 'package:js/js.dart';

@JS()
class AdMob {
	external static createBanner(BannerOptions options);

	external static hideBanner();

	external static showBanner(int position);

	external static showBannerAtXY(int x, int y);

	external static removeBanner();

	external static prepareInterstitial(InterstitialOptions options);

	external static showInterstitial();
}

@JS()
@anonymous
class InterstitialOptions {

	external String get adId;
	external set adId(String v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get autoShow;
	external set autoShow(bool v);

	external Function get success;
	external set success(Function v);

	external Function get error;
	external set error(Function v);

	external factory InterstitialOptions({
		String adId,
		bool autoShow: false,
		bool isTesting: false
	});

}

@JS()
@anonymous
class BannerOptions {

	external String get adId;
	external set adId(String v);

	external int get position;
	external set position(int v);

	external bool get autoShow;
	external set autoShow(bool v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get overlap;
	external set overlap(bool v);

	external bool get offsetTopBar;
	external set offsetTopBar(bool v);

	external String get bgColor;
	external set bgColor(String v);

	external Function get success;
	external set success(Function v);

	external Function get error;
	external set error(Function v);

	external factory BannerOptions({
		String adId,
		int position,
		bool autoShow: true,
		bool isTesting: false,
		bool overlap: false,
		bool offsetTopBar: false,
		String bgColor: 'black'
	});

}

enum AdMobPosition {
	NO_CHANGE,
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	LEFT,
	CENTER,
	RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT,
	POS_XY
}
