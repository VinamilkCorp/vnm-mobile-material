import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/global/auth.dart';
import '../../core/global/loader.dart';
import '../../core/global/localization.dart';
import '../../core/global/navigator.dart';
import '../../core/global/network.dart';
import '../../core/global/route.dart';
import '../../extension/change_notifier.dart';
import '../styles/color.dart';
import '../styles/theme_data.dart';
import 'image.dart';
import 'text_view.dart';

class VinamilkApp extends StatefulWidget {
  final String title;
  final Widget Function(AppRoute route, Object? args) routeBuilder;
  final Function()? onInitState;

  const VinamilkApp(
      {super.key,
      required this.title,
      required this.routeBuilder,
      this.onInitState});

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
    return FutureBuilder<AppRoute>(
        future: _initialRoute(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container(
                  padding: EdgeInsets.all(40),
                  color: VNMColor.white(),
                  child: VNMImage("assets/logo.png"),
                )
              : Builder(
                  builder: (context) => MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: Stack(
                        children: [
                          Navigator(
                            key: VNMNavigator().key,
                            initialRoute: snapshot.data!.name,
                            onGenerateRoute: onGenerateRoute,
                          ),
                          _buildNetwork(),
                          _buildLoading(),
                        ],
                      )));
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
      return Visibility(
          visible: loading.isLoading,
          child: Container(
            color: Colors.black12.withOpacity(0.1),
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ));
    });
  }

  Future<AppRoute> _initialRoute() async {
    await Auth().initialized();
    return Auth().getRoute();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    return settings.onGenerateRoute(context, widget.routeBuilder);
  }
}
