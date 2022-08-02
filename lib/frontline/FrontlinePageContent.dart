import 'package:flutter/material.dart';

import 'FrontlinePageContentItem.dart';

class FrontlinePageContent extends StatelessWidget {
  const FrontlinePageContent(
      {
        Key? key,
        required this.title,
        required this.infoList,
      }
      ) : super(key: key);

  final String title;
  final List infoList;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
              child: Text(title, style: Theme.of(context).textTheme.bodyText1)
          ),
            Column(
              children: [
                for(int i=0; i < infoList.length/3; i++)
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if(infoList.length - i*3 > 3)
                          for(int j=0; j<3; j++)
                            FrontlinePageContentItem(
                              textList: infoList[i*3 + j],
                            )
                        else
                          for(int j=0; j<infoList.length - i*3; j++)
                            FrontlinePageContentItem(
                            textList: infoList[i*3 + j],
                            ),
                      ],
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
