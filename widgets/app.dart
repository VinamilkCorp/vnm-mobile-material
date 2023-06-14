import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/exception/exception.dart';
import '../../core/global/loader.dart';
import '../../core/global/localization.dart';
import '../../core/global/navigator.dart';
import '../../core/global/network.dart';
import '../../core/global/route.dart';
import '../../core/global/tracking.dart';
import '../../extension/change_notifier.dart';
import '../../extension/object.dart';
import '../../feature/auth/auth.dart';
import '../styles/color.dart';
import '../styles/theme_data.dart';
import 'image.dart';
import 'loading.dart';
import 'scaffold.dart';
import 'text_view.dart';

class VinamilkApp extends StatefulWidget {
  final String title;
  final Function()? onInitState;

  const VinamilkApp({super.key, required this.title, this.onInitState});

  @override
  State<StatefulWidget> createState() => VinamilkAppState();
}

class VinamilkAppState extends State<VinamilkApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.onInitState != null) widget.onInitState!();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        LoadingNotifier().create<LoadingNotifier>(),
        NetworkNotifier().create<NetworkNotifier>(),
        AuthNotifier().create<AuthNotifier>(),
      ],
      builder: (context, child) {
        Loader().init(context);
        Network().init(context);
        Auth().init(context);
        return MaterialApp(
          title: widget.title,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('vi', 'VN'),
            Locale('en', 'US'),
          ],
          localeListResolutionCallback: onLocaleListResolutionCallback,
          theme: VNMThemeData().root,
          builder: appBuilder,
        );
      },
    );
  }

  Widget appBuilder(BuildContext context, Widget? child) {
    Localization().initialize(context);
    return FutureBuilder<void>(
        future: _initialAuth(),
        builder: (context, snapshot) {
          return Auth().initCompleted
              ? Builder(
                  builder: (context) => MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: Stack(
                        children: [
                          Navigator(
                            key: VNMNavigator().key,
                            initialRoute: "launch",
                            onGenerateRoute: onGenerateRoute,
                          ),
                          _buildNetwork(),
                          _buildLoading(),
                        ],
                      )))
              : Container(
                  padding: EdgeInsets.all(40),
                  color: VNMColor.white(),
                  child: VNMImage("assets/logo.png"),
                );
        });
  }

  Locale? onLocaleListResolutionCallback(
      List<Locale>? locales, Iterable<Locale> supportedLocales) {
    final locale = locales?.first.languageCode;
    if (locale == 'vi') {
      return const Locale('vi', 'VN');
    }
    return const Locale('en', 'US');
  }

  _buildNetwork() {
    return Consumer<NetworkNotifier>(builder: (context, network, _) {
      return AnimatedCrossFade(
          firstChild: SizedBox(width: double.infinity),
          secondChild: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: VNMColor.error(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20)
                      .copyWith(top: 0),
                  alignment: Alignment.center,
                  child: SafeArea(
                    bottom: false,
                    child: VNMText.white12(
                      Localization().locale.no_internet_connection,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          firstCurve: Curves.fastLinearToSlowEaseIn,
          secondCurve: Curves.fastOutSlowIn,
          crossFadeState: network.isConnected
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 200));
    });
  }

  _buildLoading() {
    return Consumer<LoadingNotifier>(builder: (context, loading, _) {
      return Visibility(visible: loading.isLoading, child: LoadingView());
    });
  }

  Future<void> _initialAuth() async {
    await Auth().initialized();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    Loader().hide();
    Widget page = VNMScaffold();
    try {
      String name = settings.name ?? "undefined";
      Map? arguments = settings.arguments?.parse<Map>();
      AppRouteBuilder? builder = arguments?["builder"];
      dynamic args = arguments?["args"];
      if (name == "launch") {
        VNMAppRoute launch = Auth().getRoute();
        builder = launch.builder;
      }
      if (builder != null) {
        if (VNMTrackingConfig().logRoute != null) {
          VNMTrackingConfig().logRoute!(name, args);
        }
        page = builder(args);
      }
    } catch (exception, stackTrace) {
      VNMException().capture(exception, stackTrace);
    }
    return MaterialPageRoute(
        builder: (_) => GestureDetector(
              child: page,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              behavior: HitTestBehavior.translucent,
            ),
        settings: settings);
  }
}
