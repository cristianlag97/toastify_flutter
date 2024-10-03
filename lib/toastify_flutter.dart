library my_custom_toast;

import 'package:flutter/material.dart';

import 'toastify_flutter.dart';

export 'src/custom_toast.dart';
export 'src/slide_out_toast.dart';
export 'src/toast_position.dart';

/// A utility class to display customizable toast notifications in a Flutter application.
///
/// The `ToastifyFlutter` class provides four types of toast messages:
/// `success`, `info`, `warning`, and `error`. These toast messages can be
/// customized by adjusting the duration, position, style, text alignment, and other
/// options. This class also handles displaying only one toast at a time.
///
/// Example usage:
///
/// ```dart
/// ToastifyFlutter.success(
///   context,
///   message: 'Operation successful!',
///   duration: 3,
///   position: ToastPosition.bottom,
///   style: ToastStyle.simple,
/// );
/// ```

class ToastifyFlutter {
  // Private constructor to prevent direct instantiation
  ToastifyFlutter._();

  // Holds the current overlay entry (toast) being displayed
  static OverlayEntry? _currentOverlayEntry;

  /// Closes the currently displayed toast, if any.
  ///
  /// This method removes the toast from the screen and sets `_currentOverlayEntry` to null.
  static void close() {
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;
  }

  /// A private method to handle the toast display logic.
  ///
  /// This method accepts a [ToastType] and other common parameters to display
  /// a toast message. It is reused by the `success`, `info`, `warning`, and `error` methods.
  static void _showToast(
    BuildContext context, {
    required String message,
    required ToastType type, // success, info, warning, error
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
    ToastStyle style = ToastStyle.simple,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.left,
    bool onClose = false,
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
            duration: duration,
            position: position,
            style: style,
            type: ToastType.success,
            textStyle: textStyle,
            textAlign: textAlign,
            onClose: onClose ? close : null,
          ),
        ),
      );
      Overlay.of(context).insert(_currentOverlayEntry!);

      await Future.delayed(Duration(seconds: duration));

      _currentOverlayEntry?.remove();
      _currentOverlayEntry = null;
    });
  }

  /// Displays a success toast message.
  ///
  /// - `context`: The build context.
  /// - `message`: The message to display in the toast.
  /// - `duration`: The duration (in seconds) for which the toast is displayed. Default is 2 seconds.
  /// - `position`: The position where the toast appears on the screen. Default is `ToastPosition.bottom`.
  /// - `style`: The visual style of the toast. Default is `ToastStyle.simple`.
  /// - `textStyle`: Optional text style for customizing the message appearance.
  /// - `textAlign`: The alignment of the text. Default is `TextAlign.left`.
  /// - `onClose`: If true, the toast can trigger an optional action upon close.
  static void success(
    BuildContext context, {
    required String message,
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
    ToastStyle style = ToastStyle.simple,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.left,
    bool onClose = false,
  }) {
    _showToast(
      context,
      message: message,
      type: ToastType.success,
      duration: duration,
      position: position,
      style: style,
      textStyle: textStyle,
      textAlign: textAlign,
      onClose: onClose,
    );
  }

  /// Displays a info toast message.
  ///
  /// (Same parameters as `success`)
  static void info(
    BuildContext context, {
    required String message,
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
    ToastStyle style = ToastStyle.simple,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.left,
    bool onClose = false,
  }) {
    _showToast(
      context,
      message: message,
      type: ToastType.info,
      duration: duration,
      position: position,
      style: style,
      textStyle: textStyle,
      textAlign: textAlign,
      onClose: onClose,
    );
  }

  /// Displays a warning toast message.
  ///
  /// (Same parameters as `success`)
  static void warning(
    BuildContext context, {
    required String message,
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
    ToastStyle style = ToastStyle.simple,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.left,
    bool onClose = false,
  }) {
    _showToast(
      context,
      message: message,
      type: ToastType.warning,
      duration: duration,
      position: position,
      style: style,
      textStyle: textStyle,
      textAlign: textAlign,
      onClose: onClose,
    );
  }

  /// Displays an error toast message.
  ///
  /// (Same parameters as `success`)
  static void error(
    BuildContext context, {
    required String message,
    int duration = 2,
    ToastPosition position = ToastPosition.bottom,
    ToastStyle style = ToastStyle.simple,
    TextStyle? textStyle,
    TextAlign textAlign = TextAlign.left,
    bool onClose = false,
  }) {
    _showToast(
      context,
      message: message,
      type: ToastType.error,
      duration: duration,
      position: position,
      style: style,
      textStyle: textStyle,
      onClose: onClose,
    );
  }
}
