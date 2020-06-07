import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assert.dart';

class ProgramItemInfo extends ChangeNotifier {
  ProgramItemInfo({
    this.index,
    this.spec,
    this.buttonTitle,
    this.buttonOnPressed,
    this.itemOnPressed,
    this.isLastItem,
  });

  int index;
  Spec spec;
  bool _showProcess = false;
  double _processValue = 0.0;
  String buttonTitle;
  void Function(ProgramItemInfo info) buttonOnPressed;
  void Function(ProgramItemInfo info) itemOnPressed;
  bool isLastItem;

  set showProcess(bool showProcess) {
    _showProcess = showProcess;
    notifyListeners();
  }

  bool get showProcess => _showProcess;

  set processValue(double processValue) {
    _processValue = processValue;
    notifyListeners();
  }

  double get processValue => _processValue;
}

class ProgramItemWidget extends StatefulWidget {
  ProgramItemWidget({
    Key key,
  }) : super(key: key);

  _ProgramItemWidgetState createState() => _ProgramItemWidgetState();
}

class _ProgramItemWidgetState extends State<ProgramItemWidget>
    with UpdateStateMixin<ProgramItemWidget> {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<ProgramItemInfo>(context);
    final Widget row = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          log.info('program item tap');
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: SizedBox(
            height: 75,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                // icon 图片, 应用名称
                Container(
                  width: 74,
                  child: Stack(
                    children: <Widget>[
                      //icon 图片
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              placeholder: (context, url) => Image.asset(
                                  'images/icon_60pt.png',
                                  package: 'flutter_app'),
                              imageUrl: info.spec.iconUrl,
                            ),
                          ),
                        ),
                      ),
                      // 应用名称
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: Text(
                            info.spec.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF3333333),
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
                // 作者，应用描述
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 6.0)),
                      // 作者
                      Text(
                        '作者：' + info.spec.author,
                        style: TextStyle(
                          color: Color(0xFF3333333),
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 4.0)),
                      // 描述
                      Expanded(
                        child: Text(
                          '简介：' + info.spec.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF6F6F6F),
                            fontSize: 11.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 6.0)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
                // 按钮
                Container(
                  width: 74,
                  height: 32,
                  child: DownloadButton(
                    title: info.buttonTitle,
                    showProcess: info.showProcess,
                    progressValue: info.processValue,
                    onPressed: (){
                      buttonOnPressed(info);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                ),
              ],
            ),
          ),
        ));

    if (info.isLastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Separator(),
        ),
      ],
    );
  }

  void buttonOnPressed(ProgramItemInfo info) {
    info.buttonOnPressed(info);
  }

  @override
  void dispose() {
    log.info('find item dispose');
    super.dispose();
  }
}
