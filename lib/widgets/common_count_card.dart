import 'package:flutter/material.dart';

class CommonCountCard extends StatefulWidget {
  final int index;
  final Color color;

  const CommonCountCard({Key? key, required this.index, required this.color}) : super(key: key);

  @override
  State<CommonCountCard> createState() => _CommonCountCardState();
}

class _CommonCountCardState extends State<CommonCountCard> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 20,
      minWidth: 20.0,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.zero,
      onPressed: null,
      child: Text(
        "${widget.index + 1}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.color,
        ),
      ),
    );
  }
}
