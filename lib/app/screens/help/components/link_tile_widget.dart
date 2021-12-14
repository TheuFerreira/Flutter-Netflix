import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/help/models/link_model.dart';

class LinkTileWidget extends StatelessWidget {
  final LinkModel linkModel;
  final bool isFirst;
  final Function()? onTap;
  const LinkTileWidget(
    this.linkModel, {
    Key? key,
    this.isFirst = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          child: Container(height: 2, color: Colors.grey[200]),
          visible: isFirst,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    linkModel.icon,
                    size: 28,
                    color: Colors.blue[800],
                  ),
                ),
                Text(
                  linkModel.title,
                  style: TextStyle(fontSize: 15, color: Colors.blue[800]),
                ),
              ],
            ),
          ),
        ),
        Container(height: 2, color: Colors.grey[200]),
      ],
    );
  }
}
