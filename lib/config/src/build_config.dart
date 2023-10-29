part of configuration;

enum Flavor { development, staging, production }

class BuildConfig {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Flavor flavor;

  static late BuildConfig _instance;

  const BuildConfig._({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.flavor,
  });

  const BuildConfig._development()
      : this._(
          baseUrl: 'https://kindoftesting.site',
          connectTimeout: const Duration(milliseconds: 20000),
          receiveTimeout: const Duration(milliseconds: 20000),
          flavor: Flavor.development,
        );

  const BuildConfig._staging()
      : this._(
          baseUrl: 'https://kindoftesting.site',
          connectTimeout: const Duration(milliseconds: 20000),
          receiveTimeout: const Duration(milliseconds: 20000),
          flavor: Flavor.staging,
        );

  const BuildConfig._production()
      : this._(
          baseUrl: 'https://kindoftesting.site',
          connectTimeout: const Duration(milliseconds: 20000),
          receiveTimeout: const Duration(milliseconds: 20000),
          flavor: Flavor.production,
        );

  static String get flavorName => _instance.flavor.name;

  static bool get isProduction => _instance.flavor == Flavor.production;

  static bool get isDevelopment => _instance.flavor == Flavor.development;

  static void init({String? flavor}) {
    debugPrint('╔══════════════════════════════════════════════════════════════╗');
    debugPrint('                    Build Flavor: $flavor                       ');
    debugPrint('╚══════════════════════════════════════════════════════════════╝');
    switch (flavor) {
      case 'production':
        _instance = const BuildConfig._production();
        break;
      case 'staging':
        _instance = const BuildConfig._staging();
        break;
      case 'development':
      default:
        _instance = const BuildConfig._development();
        break;
    }
    _initLog();
  }

  static BuildConfig get() {
    return _instance;
  }

  static Future<void> _initLog() async {
    await Log.init();
    switch (_instance.flavor) {
      case Flavor.development:
      case Flavor.staging:
        Log.setLevel(Level.ALL);
        break;
      case Flavor.production:
        Log.setLevel(Level.OFF);
        break;
    }
  }
}
