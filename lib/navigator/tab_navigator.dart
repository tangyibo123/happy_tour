import 'package:flutter/material.dart';
import 'package:happy_tour/pages/home_page.dart';
import 'package:happy_tour/pages/order_page.dart';
import 'package:happy_tour/pages/note_page.dart';
import 'package:happy_tour/pages/my_page.dart';


class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          OrderPage(),
          NotePage(),
          MyPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,//固定label
        items: [
          _bottomItem('首页', Icons.home, 0),
          _bottomItem('订单', Icons.local_grocery_store, 1),
          _bottomItem('攻略', Icons.assignment, 2),
          _bottomItem('我的', Icons.account_circle, 3),
        ],
        fixedColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
    );
    throw UnimplementedError();

  }
  void _onItemTapped(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  _bottomItem(String label, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: label
    );
  }

  void _onAdd(){
  }

}