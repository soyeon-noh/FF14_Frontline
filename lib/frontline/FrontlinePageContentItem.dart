import 'package:flutter/material.dart';

class FrontlinePageContentItem extends StatelessWidget {
  const FrontlinePageContentItem(
      {
        Key? key,
        required this.textList,
      }
      ) : super(key: key);

  final List textList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0; i < textList.length; i++)
          Text(textList[i],
              style: Theme
              .of(context)
              .textTheme
              .bodyText2),
      ],
    );
  }
}
