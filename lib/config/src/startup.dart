part of configuration;

abstract class Startup {
  Startup() {
    _init();
  }

  void _init() {
    if (kReleaseMode) {
      // Used to prevent printing in release mode
      debugPrint = (String? message, {int? wrapWidth}) {};
    }

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      // final String? flavor = await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
      BuildConfig.init(flavor: const String.fromEnvironment('flavor'));

      Themes.initUiOverlayStyle();
      await HiveDatabase.init();

      final app = await onCreate();

      runApp(
        ProviderScope(
          child: app,
        ),
      );
    }, (obj, stack) {
      debugPrint(obj.toString());
      debugPrint(stack.toString());
    });
  }

  FutureOr<HookConsumerWidget> onCreate();
}
