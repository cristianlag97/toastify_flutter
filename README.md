# ToastifyFlutter

The ToastifyFlutter package provides an easy way to display toasts in Flutter applications. Toasts are brief popup messages shown on the screen to inform the user about an action or state in the application.

With ToastifyFlutter, you can display customizable toasts with different durations and positions on the screen. This package simplifies the implementation of toasts in your Flutter application, allowing you to easily integrate informative messages in a visually effective manner.

Key features:

- Display toasts with customizable messages.
- Configure the duration and position of the toast on the screen.
- Seamless integration into Flutter applications to provide user feedback intuitively.

This translation captures the essence of your package's description and its functionalities in English. If you need further adjustments or have more content to translate, feel free to let me know!

# How to use

```
dependencies:
  toastify_flutter: 1.0.4
 ```


```
import 'package:toastify_flutter/flutter_toastify.dart';
 ```

# Display a Toast
To display a simple toast, use the following code:

```
ToastifyFlutter.show(
  context,
  message: 'This is a custom toast message',
  duration: 2,
);
 ```

 # Example

```
import 'package:flutter/material.dart';
import 'package:toastify_flutter/flutter_toastify.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToastifyFlutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ToastifyFlutter.show(
                context,
                message: 'This is a custom toast message',
              );
            },
            child: Text('show toast'),
          ),
        ),
      ),
    );
  }
}

```

# Toast Top

```
ElevatedButton(
  onPressed: () {
    ToastifyFlutter.show(
      context,
      message: 'This is a custom toast message',
      position: ToastPosition.top,
    );
  },
  child: Text('show toast'),
),
```
<img src="screenshots/capture1.png" width=300>

# Toast error
```
ElevatedButton(
  onPressed: () {
    ToastifyFlutter.show(
      context,
      message: 'This is a custom toast message',
      position: ToastPosition.top,
      isFailed: true,
    );
  },
  child: Text('show toast'),
),
```
<img src="screenshots/capture2.png" width=300>


# Toast Bottom

```
ElevatedButton(
  onPressed: () {
    ToastifyFlutter.show(
      context,
      message: 'This is a custom toast message',
      position: ToastPosition.bottom,
       isFailed: true,
    );
  },
  child: Text('show toast'),
),
```
<img src="screenshots/capture3.png" width=300>