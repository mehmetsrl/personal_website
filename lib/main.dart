import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'locator.dart';
import 'routing/route_names.dart';
import 'routing/router.dart';
import 'services/data_storage_service.dart';
import 'services/navigation_service.dart';
import 'views/layout_template/layout_template.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {
  setupLocator();
  runApp(MyApp());
}

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      builder: (context,child)=> LayoutTemplate(child: child,),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
