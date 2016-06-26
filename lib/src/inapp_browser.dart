@JS()
library InappBrowser;

import 'package:js/js.dart';

@JS('cordova.InAppBrowser')
class InappBrowser {
	static const String TARGET_SELF = '_self';
	static const String TARGET_BLANK = '_blank';
	static const String TARGET_SYSTEM = '_system';

	static const String EVENT_LOADSTART = 'loadstart';
	static const String EVENT_LOADSTOP = 'loadstop';
	static const String EVENT_LOADERROR = 'loaderror';
	static const String EVENT_EXIT = 'exit';

	external static InappBrowser open(String url, String target, [String options]);

	external addEventListener(String eventname, Function cb);
	external removeEventListener(String eventname, Function cb);
	external close();
	external show();
	external executeScript(InjectDetails details, Function cb);
	external insertCSS(InjectDetails details, Function cb);
}

@JS()
@anonymous
class InjectDetails {
	external String get file;

	external set file(String v);

	external String get code;

	external set code(String v);
}


