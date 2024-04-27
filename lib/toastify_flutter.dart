library my_custom_toast;

import 'package:flutter/material.dart';

import 'toastify_flutter.dart';

export 'src/custom_toast.dart';
export 'src/slide_out_toast.dart';
export 'src/toast_position.dart';

class ToastifyFlutter {
  static OverlayEntry? _currentOverlayEntry;

  static void show(
    BuildContext context, {
    required String message,
    bool isFailed = false,
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_currentOverlayEntry != null) {
        return;
      }

      _currentOverlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: position == ToastPosition.top ? 50.0 : null,
          bottom: position == ToastPosition.bottom ? 40.0 : null,
          left: 0.0,
          right: 0.0,
          child: SlideOutToast(
            message: message,
            isFailed: isFailed,
            duration: duration,
            position: position,
          ),
        ),
      );
      Overlay.of(context).insert(_currentOverlayEntry!);

      await Future.delayed(Duration(seconds: duration));

      _currentOverlayEntry?.remove();
      _currentOverlayEntry = null;
    });
  }
}
