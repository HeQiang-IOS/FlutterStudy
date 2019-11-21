import 'package:flutter/material.dart';
/** 
{
  box-sizing: border-box
}
*/
TextStyle bold24Roboto = new TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'Georgia',
);
/**
 <div class='greybox'>
 Lorem ipsum
 </div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
 }
 */

var container = new Container(
  child: new Text(
    'Lorem ipsum',
    style: new TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w900,
      fontFamily: 'Georgia',
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var container2 = new Container(
  child: new Text(
    'Lorem ipsum',
    style: bold24Roboto,
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

/**
 设置背景色
 <div class='greybox'>
 Lorem ipsum
 </div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 */

var container3 = new Container(
  child: new Center(
    child: new Text(
      'Lorem ipsum',
      style:bold24Roboto,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

/**
居中组件
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   background-color: #ef5350;
   padding: 16px;
   color: #fffff
   width: 100%
   max-width: 240px;
 }
 */

var container4 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400],
      ),
      padding: new EdgeInsets.all(16.0),
      width: 240.0,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

/**
 控制位置和大小
 设置绝对位置
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   position: relative;
 }
 .redBox {
   background-color: #ef5350;
   padding: 16px;
   color: #fffff
   position: absolute;
   top: 24px;
   left: 24px;
 }
 */

var container5 = new Container(
  child: new Stack(
    children: <Widget>[
      new Positioned(
        child: new Container(
          child: new Text(
            'Lorem ipsum',
            style: bold24Roboto,
          ),
          decoration: new BoxDecoration(
            color: Colors.red[400],
          ),
          padding: new EdgeInsets.all(16.0),
        ),
        left: 24.0,
        top: 24.0,
      )
    ],
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 旋转
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   background-color: #ef5350;
   padding: 16px;
   color: #fffff
   transform: rotate(15deg)
 }
 */

var container6 = new Container(
  child: new Center(
    child: new Transform(
      child: new Container(
        child: new Text(
          'Lorem ipsum',
          style: bold24Roboto,
          textAlign: TextAlign.center,
        ),
        decoration: new BoxDecoration(
          color: Colors.red[400],
        ),
        padding: new EdgeInsets.all(16.0),
      ),
      alignment: Alignment.center,
      transform: new Matrix4.identity()..rotateZ(15 * 3.1415927/180),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 缩放
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   background-color: #ef5350;
   padding: 16px;
   color: #fffff;
   transform: scale(1.5);
 }
 */

var container7 = new Container(
  child: new Center(
    child: new Transform(
      child: new Container(
        child: new Text(
          'Lorem ipsum',
          style: bold24Roboto,
          textAlign: TextAlign.center,
        ),
        decoration: new BoxDecoration(
          color: Colors.red[400]
        ),

        padding: new EdgeInsets.all(16.0),
      ),
      alignment: Alignment.center,
      transform: new Matrix4.identity()..scale(1.5),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

/**
 垂直渐变
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   
   padding: 16px;
   color: #fffff;
   background: linear-gradient(180deg, #ef5350, rgba(0, 0, 0, 0) 80%);
 }
 */
var container8 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: const Alignment(0.0, -1.0),
          end: const Alignment(0.0, 0.6),
          colors: <Color>[
            const Color(0xffef5350),
            const Color(0x00ef5350)
          ],
        ),
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 水平渐变
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   
   padding: 16px;
   color: #fffff;
   background: linear-gradient(90deg, #ef5350, rgba(0, 0, 0, 0) 80%);
 }
 */
var container9 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: const Alignment(-1.0, 0.0),
          end: const Alignment(0.6, 0.0),
          colors: <Color>[
            const Color(0xffef5350),
            const Color(0x00ef5350)
          ],
        ),
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

/**
 处理形状
 圆角
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   border-radius: 8px;
 }
 */
var container10 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),

      decoration: new BoxDecoration(
        color: Colors.red[400],
        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 处理形状
 圆角
 <div class='greybox'>
  <div class='redbox'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redBox {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.8), 0 6px 20px rgba(0, 0, 0, 0.5);
 }
 */
var container11 = new Container(
  child: new Center(
    child: new Container(
      child: new Text('Lorem ipsum', style: bold24Roboto,),
      decoration: new BoxDecoration(
        color: Colors.red[400],
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: const Color(0xcc000000),
            offset: new Offset(0.0, 2.0),
            blurRadius: 4.0
          ),

          new BoxShadow(
            color: const Color(0x80000000),
            offset: new Offset(0.0, 6.0),
            blurRadius: 20.0
          ),
        ]
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  decoration: new BoxDecoration(
    color: Colors.grey[300]
  ),
  margin: new EdgeInsets.only(bottom: 16.0),
);



/**
 处理形状
 圆与椭圆
 <div class='greybox'>
  <div class='redcircle'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redcircle {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   text-align: center;
   width: 160px;
   height: 160px;
   border-radius: 50%
 }
 */

var container12 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: bold24Roboto,
        textAlign: TextAlign.center,
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400],
        shape: BoxShape.circle,
      ),

      padding: new EdgeInsets.all(16.0),
      width: 160.0,
      height: 160.0,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 文本
 <div class='greybox'>
  <div class='redcircle'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redcircle {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   letter-spacing: 4px;
 }
 */

var container13 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
          letterSpacing: 4.0
        ),
      ),

      decoration: new BoxDecoration(
        color: Colors.red[400]
      ),

      padding: new EdgeInsets.all(16.0),
    ),
  ),

  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 文本
 <div class='greybox'>
  <div class='redcircle'>
   Lorem ipsum
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redcircle {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   text-transform: uppercase;
 }
 */

var container14 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum'.toUpperCase(),
        style: bold24Roboto,
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400]
      ),

      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 文本
 <div class='greybox'>
  <div class='redcircle'>
   Lorem <em>ipsum<em>
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redcircle {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
 }
 */

var container15 = new Container(
  child: new Center(
    child: new Container(
      child: new RichText(
        text: new TextSpan(
          style: bold24Roboto,
          children: <TextSpan>[
            new TextSpan(text: 'Lorem'),
            new TextSpan(
              text: 'ipsum',
              style: new TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 48.0
              )
            )
          ]
        ),
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400]
      ),

      padding: new EdgeInsets.all(16.0),
    ),
  ),

  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);


/**
 文本
 <div class='greybox'>
  <div class='redcircle'>
   Lorem ipsum dolor sit amet, consec etur
  </div>
</div>

 .greybox {
   background-color: #e0e0e0;
   width: 320px;
   height: 240px;
   font 900 24px Georgia;
   display: flex;
   align-items: center;
   justify-content: center;
 }
 .redcircle {
   background-color: #ef5350
   padding: 16px;
   color: #fffff;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
 }
 */

var container16 = new Container(
  child: new Center(
    child: new Container(
      child: new Text(
        'Lorem ipsum dolor sit amet, consec etur',
        style: bold24Roboto,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      decoration: new BoxDecoration(
        color: Colors.red[400]
      ),
      padding: new EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);