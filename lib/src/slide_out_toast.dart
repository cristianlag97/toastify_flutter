import 'package:flutter/material.dart';
import 'package:toastify_flutter/toastify_flutter.dart';

/// A widget that displays a custom toast message with a sliding animation.
///
/// The toast slides in from either the top, bottom, left, or right of the screen,
/// depending on the provided [ToastPosition] and [ToastAlignment], and slides out after a specified [duration].
///
/// The appearance of the toast can be customized using the [style], [textStyle],
/// [textAlign], and [type] properties. Optionally, you can pass a callback
/// [onClose] that is invoked when the toast is dismissed.
///
/// This widget uses an [AnimationController] and a [CurvedAnimation] to handle the sliding animation.

class SlideOutToast extends StatefulWidget {
  /// The message to be displayed in the toast.
  final String message;

  /// The duration (in seconds) for which the toast will be displayed before sliding out.
  final int duration;

  /// The position where the toast will appear on the screen (top or bottom).
  final ToastPosition position;

  /// The alignment where the toast will appear horizontally (left, right, or center).
  final ToastAlignment alignment;

  /// The style of the toast (flat, filled, etc.), which affects the background color.
  final ToastStyle style;

  /// The type of the toast (success, error, warning, info), which affects its icon and theme.
  final ToastType type;

  /// Optional text style for customizing the appearance of the message text.
  final TextStyle? textStyle;

  /// The alignment of the text within the toast.
  final TextAlign? textAlign;

  /// An optional callback that is triggered when the toast is dismissed.
  final VoidCallback? onClose;

  /// The animation curve used for the slide transition effect.
  final Curve animationCurve;

  /// Creates a [SlideOutToast] widget.
  ///
  /// The [message], [position], [style], and [type] are required.
  /// The default [duration] is 2 seconds.
  const SlideOutToast({
    super.key,
    required this.message,
    this.duration = 2,
    required this.position,
    required this.alignment,
    required this.type,
    required this.style,
    required this.animationCurve,
    this.textStyle,
    this.textAlign,
    this.onClose,
  });

  @override
  State<SlideOutToast> createState() => _SlideOutToastState();
}

/// The state class for [SlideOutToast].
///
/// This class manages the sliding animation of the toast, which is achieved
/// using an [AnimationController] and [Tween] for the vertical offset.
class _SlideOutToastState extends State<SlideOutToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();

    // Initializes the AnimationController with a duration of 500 milliseconds.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Determines the initial position based on alignment and position.
    final Offset beginOffset = switch (widget.alignment) {
      ToastAlignment.left => const Offset(-1.0, 0.0), // Slide in from left.
      ToastAlignment.right => const Offset(1.0, 0.0), // Slide in from right.
      _ => widget.position == ToastPosition.top
          ? const Offset(0.0, -1.0) // Slide in from top.
          : const Offset(0.0, 1.0), // Slide in from bottom.
    };

    // Creates a curved animation based on the provided animation curve.
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve, // Puedes cambiar el tipo de curva
    );

    // Defines the sliding animation's start and end positions based on the toast's position.
    _position = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero, // End at the center of the screen.
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    // Disposes of the AnimationController when the widget is removed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Starts the slide-in animation when the widget is built.
    _controller.forward();

    return SlideTransition(
      position: _position,
      // Displays the custom toast with the provided message, style, and alignment.
      child: CustomToast(
        message: widget.message,
        type: widget.type,
        style: widget.style,
        textStyle: widget.textStyle,
        textAlign: widget.textAlign,
        onClose: widget.onClose,
      ),
    );
  }
}
