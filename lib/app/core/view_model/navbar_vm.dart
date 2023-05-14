import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';


class NavBarViewModel extends GetxController {
  var selectedIndex = 0.obs;


  @override
  void onInit() {
    requestPermission();
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }

  void requestPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      announcement: false,
      provisional: false,
      alert: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User Granted Permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('title: ${message.notification?.title} | Body: ${message.notification?.body}');
    });
  }

  void changeIndex(int index){
    selectedIndex.value = index;
  }
}