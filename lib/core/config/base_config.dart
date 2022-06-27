abstract class BaseConfig {
  String get appName;
  String get baseUrl;
  String get envFileName;
}

class DevelopmentConfig implements BaseConfig {
  @override
  String get appName => 'Flutter Demo Development';

  @override
  String get baseUrl => 'https://dummyapi.io/data/v1/';

  @override
  String get envFileName => '.env_dev';
}

class StagingConfig implements BaseConfig {
  @override
  String get appName => 'Flutter Demo Staging';

  @override
  String get baseUrl => 'https://dummyapi.io/data/v1/';

  @override
  String get envFileName => '.env_staging';
}

class ProductionConfig implements BaseConfig {
  @override
  String get appName => 'Flutter Demo Production';

  @override
  String get baseUrl => 'https://dummyapi.io/data/v1/';

  @override
  String get envFileName => '.env';
}
