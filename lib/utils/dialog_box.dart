import 'package:flutter/material.dart';
import 'dart:ui';

class DialogBackground extends StatelessWidget {
  final Widget? dialog;
  final bool? disable;
  final Function? onDismiss;
  final double? blur;
  final Color? barrierColor;

  const DialogBackground({
    Key? key,
    this.dialog,
    this.disable,
    this.blur,
    this.onDismiss,
    this.barrierColor,
  }) : super(key: key);

  Future<T?> show<T>(BuildContext context, {bool? disable}) {
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => this,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.5),
      barrierDismissible: disable ?? true,
      barrierLabel: "",
      transitionDuration: Duration.zero,
      useRootNavigator: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.transparent,
      child: WillPopScope(
        onWillPop: () async {
          if (disable ?? true) {
            if (onDismiss != null) onDismiss?.call();
            return true;
          }
          return false;
        },
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (disable ?? true) {
                  onDismiss?.call();
                  Navigator.pop(context);
                }
              },
              child: (blur ?? 0) < 1
                  ? Container()
                  : TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.1, end: blur ?? 0),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, double? val, Widget? child) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: val ?? 0, sigmaY: val ?? 0),
                          child: Container(color: Colors.transparent),
                        );
                      },
                    ),
            ),
            dialog ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}


