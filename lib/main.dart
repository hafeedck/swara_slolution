import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:swara_solution_flutter_machine_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Swara Solutions',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        primaryColor: Colors.black,
        fontFamily: 'Manrope',
      ),
    );
  }
}
