import 'package:flutter/material.dart';
import 'package:toastify_flutter/toastify_flutter.dart';

class SlideOutToast extends StatefulWidget {
  final String message;
  final bool isFailed;
  final int duration;
  final ToastPosition position;

  const SlideOutToast({
    super.key,
    required this.message,
    this.isFailed = false,
    this.duration = 2,
    required this.position,
  });

  @override
  State<SlideOutToast> createState() => _SlideOutToastState();
}

class _SlideOutToastState extends State<SlideOutToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _position = Tween<Offset>(
      begin: widget.position == ToastPosition.top
          ? const Offset(0.0, -1.0)
          : const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return SlideTransition(
      position: _position,
      child: CustomToast(
        message: widget.message,
        isFailed: widget.isFailed,
      ),
    );
  }
}
