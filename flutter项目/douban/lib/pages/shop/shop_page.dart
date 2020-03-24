
import 'package:douban/util/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url1 = 'https://flutterchina.club/';
String url2 = 'http://flutterall.com/';

bool _closed = false;
bool _isShow = true;

///提供链接到一个唯一webview的单例实例，以便您可以从应用程序的任何位置控制webview
final _webviewReference = FlutterWebviewPlugin();

class ShopPageWidget extends StatelessWidget {

  void setShowState(bool isShow){
    _isShow = isShow;
    if (!isShow) {
      _closed = true;
      _webviewReference.hide();
      _webviewReference.close();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebViewPageWidget();
  }
}

class WebViewPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WebViewPageWidgetState();
  }

}

class _WebViewPageWidgetState extends State<WebViewPageWidget> with SingleTickerProviderStateMixin{
  var list = ['豆芽豆品', '豆芽时间'];
  int selectIndex = 0;
  Color selectColor, unselectColor;
  TextStyle selectStyle, unselectStyle;
  TabController tabController;

  void initState(){
    super.initState();
    _webviewReference.close();
    tabController = new TabController(length: list.length, vsync: this);
    selectColor = Colors.green;
    unselectColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18);
    unselectStyle = TextStyle(fontSize: 18);

    _webviewReference.onUrlChanged.listen((String url){
      if(url != url1 || url != url2) {
        print("new url = $url");
      }
    });
  }

  void dispose(){
    super.dispose();
    tabController.dispose();
    _webviewReference.close();
    _webviewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (!_isShow) {
      return Container();
    }
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TabBar(
                      tabs: list.map((item)=>Text(item)).toList(),
                      isScrollable: false,
                      controller: tabController,
                      indicatorColor: selectColor,
                      labelColor: selectColor,
                      labelStyle: selectStyle,
                      unselectedLabelColor: unselectColor,
                      unselectedLabelStyle: unselectStyle,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (selectIndex){
                        this.selectIndex = selectIndex;
                        _webviewReference.reloadUrl(selectIndex == 0? url1 :url2);
                      },
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: _WebViewWidget(selectIndex ==0 ? url1 : url2),
            )
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}

class _WebViewWidget extends StatefulWidget {
  final String url;
  _WebViewWidget(this.url, {Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WebViewWidgetState();
  }

}

class _WebViewWidgetState extends State<_WebViewWidget> {

  Rect _rect;
  bool needFullScreen = false;

  void initState(){
    super.initState();
    _webviewReference.close();
  }

  void dispose(){
    super.dispose();
    _webviewReference.close();
    _webviewReference.dispose();
  }

  getRect() {
    if(needFullScreen){
      return null;
    }else{
      return null;
      // return Rect.fromLTRB(0.0, ScreenUtils.getStatusBarH(context) + 60.0,
      //     ScreenUtils.screenW(context), ScreenUtils.screenH(context));
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _WebViewPlaceholder(onRectChanged: (Rect value){
      if(_rect == null || _closed) {
        if(_rect != value) {
          _rect = value;
        }

        _webviewReference.launch(widget.url,
        withJavascript: true,
        withLocalStorage: true,
        scrollBar: true,
        // rect: getRect()
        );
      }else {
        if(_rect != value){
          _rect = value;
        }
        _webviewReference.reloadUrl(widget.url);
      }
    }, child: const Center(
      child: const CircularProgressIndicator(),
    ),);
  }

}

class _WebViewPlaceholder extends SingleChildRenderObjectWidget {
  const _WebViewPlaceholder({
    Key key,
    @required this.onRectChanged,
    Widget child,
  }):super(key:key, child:child);

  final ValueChanged<Rect> onRectChanged;
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return _WebViewPlaceholderRender(
      onRectChanged: onRectChanged,
    );
  }

  void updateRenderObject(BuildContext context, _WebViewPlaceholderRender renderObject){
    renderObject..onRectChanged = onRectChanged;

  }

}

class _WebViewPlaceholderRender extends RenderProxyBox {

  ValueChanged<Rect> _callback;
  Rect _rect;
  Rect get rect => _rect;


  _WebViewPlaceholderRender({
    RenderBox child,
    ValueChanged<Rect> onRectChanged,
  }) : _callback = onRectChanged, super(child);

  set onRectChanged(ValueChanged<Rect> callback) {
    if(callback != _callback) {
      _callback = callback;
      notifyRect();
    }
  }

  void notifyRect(){
    if(_callback != null && _rect != null) {
      _callback(_rect);
    }
  }

  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final rect = offset & size;
    if(_rect != rect) {
      _rect = rect;
      notifyRect();
    }
  }
}

