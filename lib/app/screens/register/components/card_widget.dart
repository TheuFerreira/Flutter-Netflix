import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final bool hasIcons;
  final Function()? onTap;
  final List<Widget>? childrens;
  const CardWidget({
    Key? key,
    this.title = '',
    this.hasIcons = false,
    this.childrens,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.grey[400]!,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Visibility(
                      child: Column(
                        children: [
                          const SizedBox(height: 16.0),
                          Row(
                            children: childrens == null ? [] : childrens!,
                          ),
                        ],
                      ),
                      visible: hasIcons,
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  size: 50,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
