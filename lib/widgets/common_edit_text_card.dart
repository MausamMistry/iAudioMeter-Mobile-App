import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class CommonEditTextCard extends StatefulWidget {
  final String? hadarName;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool isError;
  final int? maxLines;
  final int? hintMaxLines;
  final int? minLines;
  final int? maxLength;
  final dynamic elevation;
  final void Function()? onTap;
  final void Function(dynamic)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextStyle? hadarStyle;
  final String? Function(String?)? validator;
  final dynamic height;
  final dynamic width;

  const CommonEditTextCard({
    Key? key,
    this.hadarName,
    this.readOnly,
    this.suffixIcon,
    this.onTap,
    this.onEditingComplete,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.hadarStyle,
    this.elevation,
    this.focusNode,
    this.onChanged,
    this.height,
    this.width,
    this.isError = false,
    this.maxLength,
    this.hintMaxLines,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CommonEditTextCard> createState() => _CommonEditTextCardState();
}

class _CommonEditTextCardState extends State<CommonEditTextCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation ?? 1,
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Theme.of(context).canvasColor,
      semanticContainer: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.hadarName.toString(), style: const TextStyle(fontWeight: FontWeight.bold)).paddingOnly(left: 5, top: 5),
          Container(
            padding: EdgeInsets.only(right: widget.suffixIcon == null ? 15 : 0, left: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor.withOpacity(.1),
              border: Border(
                bottom: BorderSide(color: widget.isError ? Colors.red : Colors.white, width: widget.isError ? 2 : 0),
              ),
            ),
            child: TextFormField(
              autofocus: true,
              readOnly: widget.readOnly ?? false,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onChanged,
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              cursorHeight: 20,
              validator: widget.validator,
              decoration: InputDecoration(
                counterText: '',
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintMaxLines: widget.hintMaxLines,
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 5);
  }
}
