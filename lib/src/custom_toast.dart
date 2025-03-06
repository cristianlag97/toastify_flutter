import 'package:flutter/material.dart';

import 'toast_position.dart';

/// A customizable toast widget to display brief messages on the screen.
///
/// The [CustomToast] class provides different styles and types of toast notifications,
/// such as success, info, warning, and error messages. It also allows customization
/// of text style and alignment.
class CustomToast extends StatelessWidget {
  /// Creates a [CustomToast].
  ///
  /// Requires a [message] to display. Optionally accepts [type], [style],
  /// [textStyle], [textAlign], and [onClose] callback.
  const CustomToast({
    super.key,
    required this.message,
    this.type = ToastType.success,
    this.style = ToastStyle.simple,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The message to be displayed in the toast.
  final String message;

  /// The type of toast. Default is [ToastType.success].
  final ToastType type;

  /// The style of the toast. Default is [ToastStyle.simple].
  final ToastStyle style;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  /// Returns the appropriate icon based on the [ToastType].
  IconData getToastIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle_outline_rounded;
      case ToastType.info:
        return Icons.info_outline;
      case ToastType.warning:
        return Icons.warning_amber_rounded;
      case ToastType.error:
        return Icons.error_outline_rounded;
    }
  }

  /// Returns the border color for the toast based on the [ToastType].
  Color getToastColorBorder(ToastType type) {
    switch (type) {
      case ToastType.info:
        return Colors.blue[900]!;
      case ToastType.warning:
        return Colors.yellow[800]!;
      case ToastType.error:
        return Colors.red[900]!;
      case ToastType.success:
        return Colors.green[900]!;
    }
  }

  /// Returns the fill color for the toast based on [ToastType] and [ToastStyle].
  Color getToastColor(ToastType type, ToastStyle style) {
    switch (type) {
      case ToastType.success:
        switch (style) {
          case ToastStyle.flat:
            return Colors.green;
          case ToastStyle.fillColored:
            return Colors.green;
          case ToastStyle.flatColored:
            return const Color(0XFFE3FAD6);
          case ToastStyle.minimal:
            return Colors.green;
          case ToastStyle.simple:
            return Colors.green;
        }
      case ToastType.info:
        switch (style) {
          case ToastStyle.flat:
            return Colors.blue;
          case ToastStyle.fillColored:
            return Colors.blue;
          case ToastStyle.flatColored:
            return const Color(0XFFDBF6FF);
          case ToastStyle.minimal:
            return Colors.blue;
          case ToastStyle.simple:
            return Colors.blue;
        }
      case ToastType.warning:
        switch (style) {
          case ToastStyle.flat:
            return const Color(0XFFFFB700);
          case ToastStyle.fillColored:
            return const Color(0XFFFFB700);
          case ToastStyle.flatColored:
            return const Color(0XFFFEF5CB);
          case ToastStyle.minimal:
            return const Color(0XFFFFB700);
          case ToastStyle.simple:
            return const Color(0XFFFFB700);
        }
      case ToastType.error:
        switch (style) {
          case ToastStyle.flat:
            return Colors.red;
          case ToastStyle.fillColored:
            return Colors.red;
          case ToastStyle.flatColored:
            return const Color(0XFFFAD6D6);
          case ToastStyle.minimal:
            return Colors.red;
          case ToastStyle.simple:
            return Colors.red;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ToastStyle.flat:
        return FlatToast(
          icon: getToastIcon(type),
          color: getToastColor(type, style),
          colorBorder: getToastColorBorder(type),
          message: message,
          textStyle: textStyle,
          textAlign: textAlign,
          onClose: onClose,
        );
      case ToastStyle.fillColored:
        return FillColoredToast(
          icon: getToastIcon(type),
          color: getToastColor(type, style),
          colorBorder: getToastColorBorder(type),
          message: message,
          textStyle: textStyle,
          textAlign: textAlign,
          onClose: onClose,
        );
      case ToastStyle.flatColored:
        return FlatColoredToast(
          icon: getToastIcon(type),
          color: getToastColor(type, style),
          colorBorder: getToastColorBorder(type),
          message: message,
          textStyle: textStyle,
          textAlign: textAlign,
          onClose: onClose,
        );
      case ToastStyle.minimal:
        return MinimalToast(
          icon: getToastIcon(type),
          color: getToastColor(type, style),
          colorBorder: getToastColorBorder(type),
          message: message,
          textStyle: textStyle,
          textAlign: textAlign,
          onClose: onClose,
        );
      case ToastStyle.simple:
        return SimpleToast(
          icon: getToastIcon(type),
          color: getToastColor(type, style),
          colorBorder: getToastColorBorder(type),
          message: message,
          textStyle: textStyle,
          textAlign: textAlign,
          onClose: onClose,
        );
    }
  }
}

/// A flat-colored toast widget.
///
/// Displays a toast with a specified [color], [icon], and [message].
class FlatColoredToast extends StatelessWidget {
  /// Creates a [FlatColoredToast].
  const FlatColoredToast({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
    required this.colorBorder,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The fill color of the toast.
  final Color color;

  /// The border color of the toast.
  final Color colorBorder;

  /// The icon displayed in the toast.
  final IconData icon;

  /// The message to be displayed in the toast.
  final String message;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: colorBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.black54,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Text(message, style: textStyle, textAlign: textAlign),
            ),
            if (onClose != null)
              IconButton(
                onPressed: onClose,
                color: Colors.grey,
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: MediaQuery.sizeOf(context).width * 0.05,
              )
            else
              const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

/// A fill-colored toast widget.
///
/// Displays a toast with a specified [color], [icon], and [message].
class FillColoredToast extends StatelessWidget {
  /// Creates a [FillColoredToast].
  const FillColoredToast({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
    required this.colorBorder,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The fill color of the toast.
  final Color color;

  /// The border color of the toast.
  final Color colorBorder;

  /// The icon displayed in the toast.
  final IconData icon;

  /// The message to be displayed in the toast.
  final String message;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: color),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Text(message,
                  style: textStyle ?? const TextStyle(color: Colors.white),
                  textAlign: textAlign),
            ),
            if (onClose != null)
              IconButton(
                onPressed: onClose,
                color: Colors.white,
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: MediaQuery.sizeOf(context).width * 0.05,
              )
            else
              const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

/// A flat toast widget.
///
/// Displays a toast with a specified [color], [icon], and [message].
class FlatToast extends StatelessWidget {
  /// Creates a [FlatToast].
  const FlatToast({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
    required this.colorBorder,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The fill color of the toast.
  final Color color;

  /// The border color of the toast.
  final Color colorBorder;

  /// The icon displayed in the toast.
  final IconData icon;

  /// The message to be displayed in the toast.
  final String message;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Text(message, style: textStyle, textAlign: textAlign),
            ),
            if (onClose != null)
              IconButton(
                onPressed: onClose,
                color: Colors.grey,
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: MediaQuery.sizeOf(context).width * 0.05,
              )
            else
              const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

/// A simple toast widget.
///
/// Displays a toast with a specified [icon] and [message].
class SimpleToast extends StatelessWidget {
  /// Creates a [SimpleToast].
  const SimpleToast({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
    required this.colorBorder,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The fill color of the toast.
  final Color color;

  /// The border color of the toast.
  final Color colorBorder;

  /// The icon displayed in the toast.
  final IconData icon;

  /// The message to be displayed in the toast.
  final String message;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                color: color,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.63,
              child: Text(message, style: textStyle, textAlign: textAlign),
            ),
            if (onClose != null)
              IconButton(
                onPressed: onClose,
                color: Colors.grey,
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: MediaQuery.sizeOf(context).width * 0.05,
              )
            else
              const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}

/// A minimal toast widget.
///
/// Displays a toast with a specified [icon] and [message].
class MinimalToast extends StatelessWidget {
  /// Creates a [MinimalToast].
  const MinimalToast({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
    required this.colorBorder,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  /// The fill color of the toast.
  final Color color;

  /// The border color of the toast.
  final Color colorBorder;

  /// The icon displayed in the toast.
  final IconData icon;

  /// The message to be displayed in the toast.
  final String message;

  /// The text style of the message.
  final TextStyle? textStyle;

  /// The alignment of the text in the toast.
  final TextAlign? textAlign;

  /// A callback that is triggered when the close button is pressed.
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.07,
              width: 2,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                color: color,
              ),
            ),
            Icon(
              icon,
              color: color,
              // color: Colors.green,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.63,
              child: Text(message, style: textStyle, textAlign: textAlign),
            ),
            if (onClose != null)
              IconButton(
                onPressed: onClose,
                color: Colors.grey,
                icon: const Icon(Icons.close),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: MediaQuery.sizeOf(context).width * 0.05,
              )
            else
              const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
