import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterzkmusic/widgets/common_text_style.dart';
import 'v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget_play_list_cover.dart';

///歌单、场景电台等封装的组件
class PlayListWidget extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final num playCount;
  final int maxLines;
  final VoidCallback onTap;
  final int index;
  final bool isPlay;

  PlayListWidget({
    this.picUrl,
    @required this.text,
    this.playCount,
    this.subText,
    this.onTap,
    this.maxLines = -1,
    this.index,
    this.isPlay = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            picUrl == null ? Container() : PlayListCoverWidget(
                picUrl,
              playCount: playCount,
              isPlay: isPlay,
            ),
            index == null ? Container() : Text(index.toString()),
            VEmptyView(5),
            Text(
              text,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subText == null ? Container() : VEmptyView(2),
            subText == null
                ? Container()
                : Text(
              subText,
              style: TextStyle(fontSize: 10, color: Colors.grey),
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
          ],
        ),
      ),
    );
  }
}
