
import 'package:personal_website/models/routing_model.dart';

extension StringExtension on String {
  RoutingModel get getRoutingData {
    var uriData = Uri.parse(this);
    // print('queryParameters length: '+uriData.queryParametersAll.values.toList().length.toString());
    // print(uriData.queryParametersAll.runtimeType);
    // print(uriData.queryParametersAll.values);
    // print(uriData.queryParametersAll['keywords']);
    // print("entries: "+uriData.queryParametersAll.entries.toString());
    return RoutingModel(
      query: uriData.queryParametersAll,
      route: uriData.path,
    );
  }
}