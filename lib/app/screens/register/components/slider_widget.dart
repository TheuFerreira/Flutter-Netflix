import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final bool onTop;
  final Widget? header;
  final String subtitle;
  final String title;
  final Widget? description;
  final Widget? footer;
  const SliderWidget({
    Key? key,
    this.onTop = false,
    this.header,
    this.subtitle = '',
    this.title = '',
    this.description,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: onTop ? 32 : 0),
      child: Column(
        mainAxisAlignment:
            onTop ? MainAxisAlignment.start : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) header!,
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: description,
          ),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
