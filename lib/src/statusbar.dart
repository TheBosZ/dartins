@JS()
library StatusBar;

import 'package:js/js.dart';

@JS('StatusBar')
class StatusBar {

	external static bool get isVisible;

	external static overlaysWebView(bool v);
	external static styleDefault();
	external static styleLightContent();
	external static styleBlackTranslucent();
	external static styleBlackOpaque();
	external static backgroundColorByName(String v);
	external static backgroundColorByHexString(String v);
	external static hide();
	external static show();
}
