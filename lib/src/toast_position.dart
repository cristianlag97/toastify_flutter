/// Enum that defines the vertical position of the toast notification.
///
/// The toast can be positioned at the top or bottom of the screen.
enum ToastPosition {
  /// The toast will be displayed at the top of the screen.
  top,

  /// The toast will be displayed at the bottom of the screen.
  bottom,
}

/// Enum that defines different styles for the toast notification.
///
/// This allows customization of the toast's appearance.
enum ToastStyle {
  /// A flat style without any fill color.
  flat,

  /// A style that is filled with a colored background.
  fillColored,

  /// A flat style with a colored background.
  flatColored,

  /// A minimalistic style for the toast.
  minimal,

  /// A simple style for the toast.
  simple,
}

/// Enum that defines different types of toast notifications.
///
/// This categorizes the toast messages based on their significance.
enum ToastType {
  /// Indicates a successful operation.
  success,

  /// Provides informational messages.
  info,

  /// Warns the user about potential issues.
  warning,

  /// Indicates an error occurred during an operation.
  error,
}
