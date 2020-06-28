import 'package:flutter/material.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_wallet.dart';

class _Item {
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}

///这个页面是作为四个tab页的容器，以Tab为基础控制每个item的显示与隐藏
class TabsPage extends StatefulWidget {
  // 实例化
  TabsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<TabsPage> {
  List<Widget> pages; // 存放tab页面的数组

  int myIndex;

  int _selectIndex = 0; // 当前tab的索引

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', 'assets/images/home-active.png', 'assets/images/home.png'),
    _Item('兑换', 'assets/images/home-active.png', 'assets/images/home.png'),
    _Item('我的', 'assets/images/home-active.png', 'assets/images/home.png'),
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();

    if (pages == null) {
      pages = [
        new TabWallet(),
        new TabWallet(),
        new TabWallet(),
      ];
    }
    if (itemList == null) {
      this.itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 30.0,
                height: 30.0,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontSize: 12.0),
              ),
              activeIcon:
                  Image.asset(item.activeIcon, width: 26.0, height: 26.0)))
          .toList();
    }

    eventBus.on<TabChangeEvent>().listen((event) {
      setState(() {
        _selectIndex = event.index;
      });
    });
  }

//Stack（层叠布局）+ Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    // print(index);
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(TabsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
//    List wallets = Provider.of<Wallet>(context).items;
//    if (wallets.length == 0) {
//      Navigator.pushNamed(context, "wallet_guide");
//    }
    return Scaffold(
      // backgroundColor: Colors.green,
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          // _getPagesWidget(3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          print('当前tab索引=> ${index}');
          eventBus.fire(TabChangeEvent(index));
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 26, //图标大小
        currentIndex: _selectIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black54,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        // fixedColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
