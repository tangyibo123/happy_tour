import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  double appBarAlpha = 0;

  List _imageUrls = [
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
  ];
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth ==0){
              //正在滚动且滚动的是第0个元素 ListView时，触发滚动事件
              _onScroll(scrollNotification.metrics.pixels); //传入滚动的距离
            }
            return false;
          },
          child: ListView(
            children: <Widget>[
              Container(
              height: 160,
              child: Swiper(
                itemBuilder: (BuildContext context, int index){
                  return Image.network(_imageUrls[index], fit: BoxFit.fill,);},
                itemCount: _imageUrls.length,
                autoplay: true,
                pagination: SwiperPagination(), //指示器
                control: SwiperControl(),
              ),
            ),
              Container(
                height: 880,
                child: ListTile(title: Text('leyou'),),
            )
            ],
          )
       )
      )
    );
    throw UnimplementedError();
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }


}


