import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
 class ThToast {

  final BuildContext? context;
  final OverlayState? overlayState;
  final AlignmentGeometry? alignment;
  final Duration? autoCloseDuration;
  final Duration? animationDuration;
  final ToastificationAnimationBuilder? animationBuilder;
  final ToastificationType? type;
  final ToastificationStyle? style;
  final Widget? title;
  final Widget? description;
  final Widget? icon;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;
  final List<BoxShadow>? boxShadow;
  final TextDirection? direction;
  final bool? showProgressBar;
  final ProgressIndicatorThemeData? progressBarTheme;
  final ToastCloseButton closeButton;
  final bool? closeOnClick;
  final bool? dragToClose;
  final bool? showIcon;
  final DismissDirection? dismissDirection;
  final bool? pauseOnHover;
  final bool? applyBlurEffect;
  final ToastificationCallbacks callbacks;

  ThToast({
    required this.context, 
    required this.title, 
    required this.description, 
    this.type = ToastificationType.success, 
    this.autoCloseDuration = const Duration(seconds: 3), 
    this.alignment = Alignment.topRight, 
    this.icon = const Icon(Icons.check_circle, color: Colors.green), 
    this.showIcon = true, 
    this.dismissDirection = DismissDirection.horizontal, 
    this.overlayState,
    this.animationDuration,
    this.animationBuilder,
    this.style,
    this.primaryColor,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderSide,
    this.boxShadow,
    this.direction,
    this.showProgressBar,
    this.progressBarTheme,
    this.closeButton = const ToastCloseButton(),
    this.closeOnClick,
    this.dragToClose,
    this.pauseOnHover,
    this.applyBlurEffect,
    this.callbacks = const ToastificationCallbacks(),
  });


  factory ThToast.success({
    required BuildContext context,
    required String title,
    required String description,
    ToastCloseButton? closeButton,
    ToastificationCallbacks? callbacks,
    Duration? autoCloseDuration,
    Duration? animationDuration,
    ToastificationAnimationBuilder? animationBuilder,
    ToastificationStyle? style,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
    List<BoxShadow>? boxShadow,
    TextDirection? direction,
    bool? showProgressBar,
    ProgressIndicatorThemeData? progressBarTheme,
    bool? closeOnClick,
    bool? dragToClose,
    bool? showIcon,
    DismissDirection? dismissDirection,
    bool? pauseOnHover, 
    bool? applyBlurEffect,
  }) {
    final ThToast toast = ThToast(
      context: context, 
      title: Text(title), 
      description: Text(description), 
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.check_circle, color: Colors.green),
      showIcon: true,
      dismissDirection: DismissDirection.horizontal,
      closeButton: closeButton ?? const ToastCloseButton(),
      closeOnClick: true,
      dragToClose: true,
      pauseOnHover: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      style: style,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      applyBlurEffect: applyBlurEffect,
    );
    toast.show();
    return toast;
  }

  factory ThToast.error({
    required BuildContext context,
    required String title,
    required String description,
    ToastCloseButton? closeButton,
    ToastificationCallbacks? callbacks,
    Duration? autoCloseDuration,
    Duration? animationDuration,
    ToastificationAnimationBuilder? animationBuilder,
    ToastificationStyle? style,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
    List<BoxShadow>? boxShadow,
    TextDirection? direction,
    bool? showProgressBar,
    ProgressIndicatorThemeData? progressBarTheme,
    bool? closeOnClick,
    bool? dragToClose,
    bool? showIcon,
    DismissDirection? dismissDirection,
    bool? pauseOnHover, 
    bool? applyBlurEffect,

  }) {
    final ThToast toast = ThToast(
      context: context, 
      title: Text(title), 
      description: Text(description), 
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.error, color: Colors.red),
      showIcon: true,
      dismissDirection: DismissDirection.horizontal,
      closeButton: closeButton ?? const ToastCloseButton(),
      closeOnClick: true,
      dragToClose: true,
      pauseOnHover: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      style: style,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      applyBlurEffect: applyBlurEffect,
    );
    toast.show();
    return toast;
  }

  factory ThToast.info({
    required BuildContext context,
    required String title,
    required String description,
    ToastCloseButton? closeButton,
    ToastificationCallbacks? callbacks,
    Duration? autoCloseDuration,
    Duration? animationDuration,
    ToastificationAnimationBuilder? animationBuilder,
    ToastificationStyle? style,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
    List<BoxShadow>? boxShadow,
    TextDirection? direction,
    bool? showProgressBar,
    ProgressIndicatorThemeData? progressBarTheme,
    bool? closeOnClick = true,
    bool? dragToClose = true,
    bool? showIcon = true,
    DismissDirection? dismissDirection = DismissDirection.horizontal,
    bool? pauseOnHover = true, 
    bool? applyBlurEffect = true,

  }) {
    final ThToast toast = ThToast(
      context: context, 
      title: Text(title), 
      description: Text(description), 
      type: ToastificationType.info,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.info, color: Colors.white),
      showIcon: showIcon,
      dismissDirection: dismissDirection,
      closeButton: closeButton ?? const ToastCloseButton(),
      closeOnClick: closeOnClick,
      dragToClose: dragToClose,
      pauseOnHover: pauseOnHover,
      callbacks: callbacks ?? const ToastificationCallbacks(),
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      style: style,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      applyBlurEffect: applyBlurEffect,
    );
    toast.show();
    return toast;
  }

  factory ThToast.warning({
    required BuildContext context,
    required String title,
    required String description,
    ToastCloseButton? closeButton,
    ToastificationCallbacks? callbacks,
    Duration? autoCloseDuration,
    Duration? animationDuration,
    ToastificationAnimationBuilder? animationBuilder,
    ToastificationStyle? style,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
    List<BoxShadow>? boxShadow,
    TextDirection? direction,
    bool? showProgressBar,
    ProgressIndicatorThemeData? progressBarTheme,
    bool? closeOnClick,
    bool? dragToClose,
    bool? showIcon,
    DismissDirection? dismissDirection,
    bool? pauseOnHover, 
    bool? applyBlurEffect,
  }) {
    final ThToast toast = ThToast(
      context: context, 
      title: Text(title), 
      description: Text(description), 
      type: ToastificationType.warning,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.warning, color: Colors.red),
      showIcon: true,
      dismissDirection: DismissDirection.horizontal,
      closeButton: closeButton ?? const ToastCloseButton(),
      closeOnClick: true,
      dragToClose: true,
      pauseOnHover: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      style: style,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding, 
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      applyBlurEffect: applyBlurEffect,
    );
    toast.show();
    return toast;
  }

  void show() {
    if (context == null) return;
    toastification.show(
      context: context!,
      type: type ?? ToastificationType.info,
      style: style,
      title: title,
      description: description,
      alignment: alignment ?? Alignment.topRight,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 3),
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      icon: icon,
      primaryColor: primaryColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      closeButton: closeButton,
      closeOnClick: closeOnClick ?? true,
      dragToClose: dragToClose ?? true,
      showIcon: showIcon ?? true,
      dismissDirection: dismissDirection ?? DismissDirection.horizontal,
      pauseOnHover: pauseOnHover ?? true,
      applyBlurEffect: applyBlurEffect,
      callbacks: callbacks,
    );
  }
}