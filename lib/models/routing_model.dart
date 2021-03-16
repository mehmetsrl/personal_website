class RoutingModel {
  final String route;
  final Map<String, dynamic> _queryParams;

  RoutingModel({
    this.route,
    Map<String, dynamic> query,
  }) : 
  _queryParams = query;

  dynamic operator [](String key) => 
  _queryParams[key];
}
