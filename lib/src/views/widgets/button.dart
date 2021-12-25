import 'package:flutter/material.dart';

class PositiveButton extends StatefulWidget {
  final String? title;
  final VoidCallback? onPressed;
  const PositiveButton({Key? key, this.title, required this.onPressed}) : super(key: key);

  @override
  _PositiveButtonState createState() => _PositiveButtonState();
}

class _PositiveButtonState extends State<PositiveButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 4)),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title ?? '',
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
      ),
    );
  }
}

class NegativeButton extends StatefulWidget {
  final String? title;
  const NegativeButton({Key? key, this.title}) : super(key: key);

  @override
  _NegativeButtonState createState() => _NegativeButtonState();
}

class _NegativeButtonState extends State<NegativeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 4)),
      ),
      onPressed: () {},
      child: Text(
        widget.title ?? '',
        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
      ),
    );
  }
}