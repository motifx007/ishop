import 'package:flutter/material.dart';

class CustomSnackBar extends State<StatefulWidget> with TickerProviderStateMixin {
  static const _sizedBoxWidth = 8.0;
  late AnimationController controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
  CustomSnackBar();

  static positiveSnackBar({required BuildContext context, String? message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar()._customSnackBar(
      message: message ?? '',
      color: Color(0xff4caf50),
      icon: Icons.task_alt_outlined,
      context: context,
    ));
  }

  static negativeSnackBar({required BuildContext context, String? message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar()._customSnackBar(
      message: message ?? '',
      color: Color(0xfff44336),
      icon: Icons.error,
      context: context,
    ));
  }

  SnackBar _customSnackBar({required String message, required Color color, required IconData icon, required BuildContext context}) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: _sizedBoxWidth),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
              maxLines: 2,
            ),
          ),
        ],
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 1500),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
        vertical: 16.0,
      ),
      behavior: SnackBarBehavior.floating,
      animation: CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
