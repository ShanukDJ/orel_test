class AppConfiguration {
  static AppConfiguration? _instance;
  late String _appEnv;

  AppConfiguration._(String env) {
    _appEnv = env;
  }

  static AppConfiguration get instance {
    if (_instance == null) {
      throw Exception("App configuration is not initialized");
    }
    return _instance!;
  }

  static Future<void> initialize(String env) async {
    _instance = AppConfiguration._(env);
  }


  ///base URL
  static Uri get _apiEndpointLive => Uri(
    scheme: 'https',
    host: 'inshorts.deta.dev',
  );

  static Uri get _apiEndpointStaging => Uri(
    scheme: 'https',
    host: 'inshorts.deta.dev'
  );


  ///this will return current version api end point uri
  Uri get apiEndpoint {
    switch (_appEnv) {
      case ("prod"):
        return _apiEndpointLive;
      case ("dev"):
        return _apiEndpointStaging;
      case ("stag"):
        return _apiEndpointStaging;
      default:
        return _apiEndpointStaging;
    }
  }
}
