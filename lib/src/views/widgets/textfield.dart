import 'package:flutter/material.dart';

enum TextFieldDesignType { fullRounded, halfRounded }

class SimpleTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? textEditingController;
  final bool? isEnable;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool? obscureText;
  const SimpleTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.textEditingController,
    this.isEnable = true,
    this.validator,
    this.maxLength,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: 'Input text',
      decoration: InputDecoration(
        // labelText: widget.labelText,
        helperText: widget.labelText,
        filled: true,
        fillColor: Colors.grey[250],
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        isDense: true,
        enabled: widget.isEnable!,
        counterText: "",
        hintStyle: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey.shade500),
      ),
      style: Theme.of(context).textTheme.headline6,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      controller: widget.textEditingController,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText!,
    );
  }
}

class SearchTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final Function? onPressed;
  final VoidCallback? onTap;
  final TextEditingController? textEditingController;
  final TextFieldDesignType textFieldDesignType;
  const SearchTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.onPressed,
    this.prefixIcon,
    this.textEditingController,
    this.textFieldDesignType = TextFieldDesignType.fullRounded,
    this.onTap,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _defaultSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextFormField(
            // initialValue: 'Input text',
            onTap: widget.onTap,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.grey[250],
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                // color: Colors.grey.shade700,
              ),
              border: OutlineInputBorder(
                borderRadius: textFieldDesignType(),
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade500),
            ),
            style: Theme.of(context).textTheme.subtitle1,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            controller: widget.textEditingController ?? _defaultSearchController,
            textInputAction: TextInputAction.search,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.transparent, // border color
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15), // border color
                shape: BoxShape.circle,
              ),
              height: 36,
              width: 36,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.close_rounded,
                  size: 20,
                ),
                onPressed: () {
                  widget.onPressed!.call();
                  if (_defaultSearchController.text.isNotEmpty) {
                    _defaultSearchController.clear();
                    widget.textEditingController?.clear();
                    widget.onChanged!('');
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius textFieldDesignType() {
    switch (widget.textFieldDesignType) {
      case TextFieldDesignType.fullRounded:
        return BorderRadius.circular(50);
      case TextFieldDesignType.halfRounded:
        return BorderRadius.circular(8);
    }
  }
}
