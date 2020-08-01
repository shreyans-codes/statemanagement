import 'ui/news_page.dart';
import 'get_manager/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    defaultTransition: Transition.cupertino,
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                controller.toggleTheme();
              },
              child: Text(
                "Change Theme",
              ),
            ),
            RaisedButton(
              onPressed: () => Get.to(NewsPage()),
              child: Text("Go to News"),
            ),
          ],
        ),
      ),
    );
  }
}
