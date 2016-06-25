@JS()
library Store;

import 'package:js/js.dart';

@JS('store')
class Store {

	static const int QUIET = 0;
	static const int ERROR = 1;
	static const int WARNING = 2;
	static const int INFO = 3;
	static const int DEBUG = 4;

	external static int get verbosity;

	external static set verbosity(int v);

	external static String get validator;

	external static set validator(String v);

	external static List<StoreProduct> get products;

	external static register(StoreProduct product);

	external static ProductEvent when(String v);

	external static refresh();

	external static order(String v);

	external static ready(Function v);
}

@JS()
@anonymous
class StoreProduct {

	static const String FREE_SUBSCRIPTION = "free subscription";
	static const String PAID_SUBSCRIPTION = "paid subscription";
	static const String NON_RENEWING_SUBSCRIPTION = "non renewing subscription";
	static const String CONSUMABLE = "consumable";
	static const String NON_CONSUMABLE = "non consumable";

	external String get id;

	external set id(String v);

	external String get alias;

	external set alias(String v);

	external String get type;

	external set type(String v);

	external bool get canPurchase;

	external String get currency;

	external String get description;

	external bool get downloaded;

	external bool get downloading;

	external bool get loaded;

	external bool get owned;

	external String get price;

	external String get state;

	external String get title;

	external String get transaction;

	external bool get valid;

	external finish();

	external factory StoreProduct({
		String id,
		String type,
		String alias: null
	});
}

@JS()
class ProductEvent {

	external loaded(Function v);

	external updated(Function v);

	external approved(Function v);

	external error(Function v);

	external owned(Function v);

	external cancelled(Function v);

	external refunded(Function v);
}
