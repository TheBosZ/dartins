@JS()
library AppSettings;

import 'package:js/js.dart';
import 'dart:async';
import 'dart:js';
import 'dart:convert';

@JS()
class AppSettings {
	external static get(Function success, Function failure, List<String> preferences);
}

class AppSettingsHelper {
	static Future<Map> get(List<String> preferences) async {
		Completer c = new Completer();
		AppSettings.get(allowInterop((var result){
			Map obj = JSON.decode(context['JSON'].callMethod('stringify', [result]));
			print(obj);
			if (obj.containsKey('o')) {
				obj = obj['o'];
			}
			c.complete(obj);
		}), allowInterop((var result){
			c.completeError(result);
		}), preferences);
		return c.future;
	}
}
