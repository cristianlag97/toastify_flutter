import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String message;
  final bool isFailed;

  const CustomToast({
    super.key,
    required this.message,
    this.isFailed = false,
  });

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
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                color: isFailed ? Colors.red : Colors.green,
              ),
              child: Icon(
                isFailed ? Icons.warning_amber_rounded : Icons.check,
                color: Colors.white,
              ),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
