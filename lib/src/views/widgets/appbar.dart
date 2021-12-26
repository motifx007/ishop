import 'package:flutter/material.dart';

enum LeadingType {back, close, menu}

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? text;
  final VoidCallback? onPressed;
  final LeadingType? leadingType;
  final List<Widget>? actions;
  const SimpleAppBar({Key? key, this.text, this.onPressed, this.leadingType, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // brightness: Theme.of(context).brightness == Brightness.dark ? Brightness.dark : Brightness.dark,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leadingType!=null?IconButton(
        icon: Icon(
          _leadingIcon(leadingType: leadingType),
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: onPressed,
      ):Container(),
      title: Text(
        text ?? '',
        textAlign: TextAlign.left,

        style: Theme.of(context).textTheme.headline6!.copyWith(height: 1.5),
      ),
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  IconData _leadingIcon({LeadingType? leadingType}) {
    switch (leadingType) {
      case LeadingType.back:
        return Icons.arrow_back_rounded;
      case LeadingType.close:
        return Icons.close;
      case LeadingType.menu:
        return Icons.menu;
      default:
        return Icons.arrow_back_rounded;
    }
  }
}
