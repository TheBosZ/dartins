@JS()
library facebook;

import 'package:js/js.dart';

@JS('facebookConnectPlugin')
class Facebook {
	external static login(List<String> perms, Function success, Function failure);
	external static logout(Function success, Function failure);
	external static getLoginStatus(Function success, Function failure);
	external static showDialog(DialogOptions options, Function success, Function failure);
	external static api(String requestPath, List<String> perms, Function success, Function failure);
	external static logEvent(String name, Object params, num valueToSum, Function success, Function failure);
	external static logPurchase(num value, String currency, Function success, Function failure);
	external static activateApp(Function success, Function failure);
	external static appInvite(Object options, Function success, Function failure);
	external static browserInit(String appId);
}

@JS()
@anonymous
class DialogOptions {
	external String get method;
	external set method(String v);

	external String get href;
	external set href(String v);

	external String get caption;
	external set caption(String v);

	external String get description;
	external set description(String v);

	external String get picture;
	external set picture(String v);

	external bool get share_feedWeb;
	external set share_feedWeb(bool v);

	external factory DialogOptions({
		String method,
		String href,
		String caption,
		String description,
		String picture,
		bool share_feedWeb: false
	});
}

