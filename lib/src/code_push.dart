@JS()
library code_push;

import 'package:js/js.dart';
import 'dart:async';
import 'dart:js';
import 'dart:convert';

@JS('codePush')
class CodePushApi {
	external static void notifyApplicationReady(Function success, Function error);
	external static void restartApplication();
	external static void reportStatus(); //This is undocumented so I'm not sure if we need it
	external static void getCurrentPackage(Function success, Function error);
	external static void getPendingPackage(Function success, Function error);
	external static void checkForUpdate(Function success, Function error, [String deploymentKey = null]);
	external static void sync(Function callback, options, Function progress);
	external static void syncInternal([Function callback, options, Function progress]);
	external static dynamic getDefaultSyncOptions();
	external static dynamic getDefaultUpdateDialogOptions();
}

//TODO: Change these into streams since it's not a "success" callback at all, it's a status one
class CodePush {
	static Future getCurrentPackage() {
		Completer c = new Completer();
		CodePushApi.getCurrentPackage(allowInterop((result, [extra = null]) {
			Map obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));
			if (obj != null && obj.containsKey('o')) {
				obj = obj['o'];
			}
			c.complete(obj);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future getPendingPackage() {
		Completer c = new Completer();
		CodePushApi.getPendingPackage(allowInterop((result, [extra = null]) {
			Map obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));
			if (obj != null && obj.containsKey('o')) {
				obj = obj['o'];
			}
			c.complete(obj);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future sync([Map<dynamic, dynamic> options = null]) {
		Completer c = new Completer();
		CodePushApi.sync(allowInterop((result) {
			if (!c.isCompleted) {
				c.complete(result);
			}
		}), {}, allowInterop((progress) {

		}));

		return c.future;
	}

	static Future checkForUpdate([String deploymentKey = null]) {
		Completer c = new Completer();

		CodePushApi.checkForUpdate(allowInterop((result) {
			if (!c.isCompleted) {
				c.complete(result);
			}
		}), allowInterop((error) {
			c.completeError(error);
		}), deploymentKey);

		return c.future;
	}

	static void restartApplication() {
		CodePushApi.restartApplication();
	}

	static Future notifyApplicationReady() {
		Completer c = new Completer();

		CodePushApi.notifyApplicationReady(allowInterop((result) {
			if (!c.isCompleted) {
				c.complete(result);
			}
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static dynamic getDefaultSyncOptions() {
		return CodePushApi.getDefaultSyncOptions();
	}

	static dynamic getDefaultUpdateDialogOptions() {
		return CodePushApi.getDefaultUpdateDialogOptions();
	}
}
