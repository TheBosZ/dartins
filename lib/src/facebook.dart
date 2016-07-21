@JS()
library facebook;

import 'package:js/js.dart';
import 'dart:async';
import 'dart:js';
import 'dart:convert';

class Facebook {
	static Future<Map> login(List<String> perms) {
		Completer c = new Completer();
		FacebookApi.login(perms, allowInterop((var result){
			var obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));

			c.complete(obj['o']);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future logout(){
		Completer c = new Completer();
		FacebookApi.logout(allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future<Map> getLoginStatus() {
		Completer c = new Completer();
		FacebookApi.getLoginStatus(allowInterop((var result){
			var obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));

			c.complete(obj['o']);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future showDialog(DialogOptions options){
		Completer c = new Completer();
		FacebookApi.showDialog(options, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future<Map> api(String requestPath, List<String> perms) {
		Completer c = new Completer();
		FacebookApi.api(requestPath, perms, allowInterop((var result){
			var obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));

			c.complete(obj['o']);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future logEvent(String name, Object params, num valueToSum) {
		Completer c = new Completer();
		FacebookApi.logEvent(name, params, valueToSum, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future logPurchase(num value, String currency) {
		Completer c = new Completer();
		FacebookApi.logPurchase(value, currency, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future activateApp() {
		Completer c = new Completer();
		FacebookApi.activateApp(allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future appInvite(Object options) {
		Completer c = new Completer();
		FacebookApi.appInvite(options, allowInterop((var result){
			c.complete(result);
		}), allowInterop((var result){
			c.completeError(result);
		}));
		return c.future;
	}

	static Future browserInit(String appId, [String version = null]) {
		Completer c = new Completer();
		FacebookApi.browserInit(appId, version, allowInterop((var result){
			c.complete(result);
		}));
		return c.future;
	}
}

@JS('facebookConnectPlugin')
class FacebookApi {
	external static login(List<String> perms, Function success, Function failure);
	external static logout(Function success, Function failure);
	external static getLoginStatus(Function success, Function failure);
	external static showDialog(DialogOptions options, Function success, Function failure);
	external static api(String requestPath, List<String> perms, Function success, Function failure);
	external static logEvent(String name, Object params, num valueToSum, Function success, Function failure);
	external static logPurchase(num value, String currency, Function success, Function failure);
	external static activateApp(Function success, Function failure);
	external static appInvite(Object options, Function success, Function failure);
	external static browserInit(String appId, [String version = null, Function success]);
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

