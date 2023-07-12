import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../auth/auth.dart';
import '../../../core/base/app.dart';
import '../../../core/global/loader.dart';
import '../../../core/global/localization.dart';
import '../../../core/global/navigator.dart';
import '../../../core/global/network.dart';
import '../../../core/global/route.dart';
import '../../../core/global/tracking.dart';
import '../../../core/util/version.dart';
import '../../../extension/change_notifier.dart';
import '../../../extension/object.dart';
import '../../exception/exception.dart';
import '../../style/color.dart';
import '../../style/theme_data.dart';
import 'loading.dart';
import 'scaffold.dart';
import 'text_view.dart';

class VinamilkApp extends StatefulWidget {
  final String title;

  const VinamilkApp({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => VinamilkAppState();
}

class VinamilkAppState extends BaseAppState<VinamilkApp> {
  @override
  String get title => widget.title;

  @override
  ThemeData get theme => VNMThemeData().root;

  @override
  GlobalKey<NavigatorState> get key => VNMNavigator().key;

  @override
  List<SingleChildWidget> get providers => [
        Loader().notifier.create<LoadingNotifier>(),
        Auth().notifier.create<AuthNotifier>(),
        Network().notifier.create<NetworkNotifier>(),
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        Version().showRequiredUpgradeAlert();
      });
    });
  }

  @override
  Future<void> onReady() async {
    Auth().initialize();
  }

  @override
  Future<bool> onInitializedAuth() {
    return Auth().initialized();
  }

  @override
  Widget buildLoading() {
    return Consumer<LoadingNotifier>(builder: (context, loading, _) {
      return Visibility(visible: loading.isLoading, child: LoadingView());
    });
  }

  @override
  Widget buildNetwork() {
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

  @override
  RouteFactory get onGenerateRoute => (RouteSettings settings) {
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
      };
}
