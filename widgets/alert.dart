import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';

import '../../core/global/localization.dart';
import '../../core/global/navigator.dart';
import 'button/text_button.dart';

enum AlertStyle { cancel, ok }

class AlertAction {
  final String title;
  final Function()? onTap;
  final AlertStyle style;

  AlertAction._(
      {required this.title, required this.onTap, required this.style});

  factory AlertAction.cancel({Function()? onTap}) {
    return AlertAction._(
        title: Localization().locale.cancel,
        onTap: onTap,
        style: AlertStyle.cancel);
  }

  factory AlertAction.close({Function()? onTap}) {
    return AlertAction._(
        title: Localization().locale.close,
        onTap: onTap,
        style: AlertStyle.cancel);
  }

  factory AlertAction.goOn({Function()? onTap}) {
    return AlertAction._(
        title: Localization().locale.continues,
        onTap: onTap,
        style: AlertStyle.ok);
  }

  factory AlertAction.agree({Function()? onTap}) {
    return AlertAction._(
        title: Localization().locale.agree, onTap: onTap, style: AlertStyle.ok);
  }
}

class Alert {
  final String? title;
  final String? message;
  final List<AlertAction>? actions;
  static bool _isShow = false;

  Alert._({this.title, this.message, this.actions});

  factory Alert.goOn({String? title, String? message}) {
    return Alert._(
        title: title ?? Localization().locale.notification,
        message: message,
        actions: [AlertAction.goOn()]);
  }

  factory Alert.close({String? title, String? message, Function()? onClosed}) {
    return Alert._(
        title: title ?? Localization().locale.notification,
        message: message,
        actions: [AlertAction.close()]);
  }

  factory Alert.agreeOrClose({
    String? title,
    String? message,
    Function()? onAgree,
    Function()? onClose,
  }) {
    return Alert._(
        title: title ?? Localization().locale.notification,
        message: message,
        actions: [
          AlertAction.close(onTap: onClose),
          AlertAction.agree(onTap: onAgree),
        ]);
  }

  Future<void> show() async {
    if (_isShow) return;
    _isShow = true;
    await Dialogs.materialDialog(
        title: title,
        msg: message,
        msgAlign: TextAlign.center,
        color: Colors.white,
        barrierDismissible: false,
        context: VNMNavigator().context,
        actions: (actions ?? []).map((it) {
          if (it.style == AlertStyle.ok) {
            return VNMTextButton.primary(
              it.title,
              onPressed: () async {
                VNMNavigator().pop();
                if (it.onTap != null) it.onTap!();
              },
            );
          } else {
            return VNMTextButton.hint(
              it.title,
              onPressed: () async {
                VNMNavigator().pop();
                if (it.onTap != null) it.onTap!();
              },
            );
          }
        }).toList());
    _isShow = false;
  }
}
