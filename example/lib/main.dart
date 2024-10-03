import 'package:flutter/material.dart';
import 'package:toastify_flutter/toastify_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
          onPressed: () {
            ToastifyFlutter.error(
              context,
              message: 'This is a custom toast message.',
              duration: 5,
              position: ToastPosition.top,
              style: ToastStyle.flat,
              onClose: true,
            );
          },
          child: const Text('Show toast')),
    );
  }
}
