//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ecommerce_app/core/functions/reciveNotification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class MyServices extends GetxService {
  late GetStorage box;
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await GetStorage.init();
    box = GetStorage();

    await requestPermission();
    reciveNotification();
    Stripe.publishableKey =
        "pk_test_51O09zbEsScftBXSET2qSqFEOGgsV5D2li2r4n8iuZCO1L08xbAEZN48hkp04X9kgY52f4blkLrxIEaNk4hlAIJxy00nSk1xm1l";

    Stripe.merchantIdentifier = 'any string works';
    //Load our .env file that contains our Stripe Secret key
    await dotenv.load(fileName: "assets/.env");
    // Get.put(AddressCtr());
    // Get.put(LanguageCtr());

    return this;
  }
}

initialServices() async {
  await Get.putAsync(
    () => MyServices().init(),
  );
}
