import 'package:flutter/material.dart';
import 'package:toastify_flutter/toastify_flutter.dart';

/// A widget that displays a custom toast message with a sliding animation.
///
/// The toast slides in from either the top or the bottom of the screen, depending
/// on the provided [ToastPosition], and slides out after a specified [duration].
///
/// The appearance of the toast can be customized using the [style], [textStyle],
/// [textAlign], and [type] properties. Optionally, you can pass a callback
/// [onClose] that is invoked when the toast is dismissed.
///
/// This widget uses an [AnimationController] to handle the sliding animation.

class SlideOutToast extends StatefulWidget {
  /// The message to be displayed in the toast.
  final String message;

  /// The duration (in seconds) for which the toast will be displayed before sliding out.
  final int duration;

  /// The position where the toast will appear on the screen (top or bottom).
  final ToastPosition position;

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

  /// Creates a [SlideOutToast] widget.
  ///
  /// The [message], [position], [style], and [type] are required.
  /// The default [duration] is 2 seconds.
  const SlideOutToast({
    super.key,
    required this.message,
    this.duration = 2,
    required this.position,
    required this.type,
    required this.style,
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

    // Defines the sliding animation's start and end positions based on the toast's position.
    _position = Tween<Offset>(
      begin: widget.position == ToastPosition.top
          ? const Offset(0.0, -1.0) // Slide in from the top.
          : const Offset(0.0, 1.0), // Slide in from the bottom.
      end: const Offset(0.0, 0.0), // End at the center of the screen.
    ).animate(_controller);
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
