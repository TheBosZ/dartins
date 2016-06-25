@JS()
library GoogleAnalytics;

import 'package:js/js.dart';

@JS('analytics')
class GoogleAnalytics {
	external static startTrackerWithId(String v);

	external static trackView(String v);

	external static trackEvent(String category, String action,
		[String label, num v]);

	external static trackException(String description, bool fatal);

	external static trackTiming(String category, num intervalInMilliseconds,
		String v, String label);

	external static addTransaction(String id, String affiliation, num revenue,
		num tax, num shipping, String currencyCode);

	external static addTransactionItem(String id, String name, String sku,
		String category, num price, num quantity, String currencyCode);

	external static addCustomDimension(String key, String value,
		[Function success, Function error]);

	external static setUserId(String id);

	external static debugMode();

	external static enableUncaughtExceptionReporting(bool enable,
		[Function success, Function error]);
}

