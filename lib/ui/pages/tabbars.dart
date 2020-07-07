import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_wallet.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_me.dart';
import 'package:xy_wallet/ui/pages/tabbar/tab_community.dart';

///这个页面是作为四个tab页的容器，以Tab为基础控制每个item的显示与隐藏
class TabsPage extends BaseWidget {
  @override
  BaseWidgetState getState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends BaseWidgetState<TabsPage> {
  @override
  bool get hasAppBar => false;

  List<Widget> pages; // 存放tab页面的数组

  int myIndex;

  int _selectIndex = 0; // 当前tab的索引

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();

    if (pages == null) {
      pages = [
        new TabWallet(),
        new TabCommunity(),
        new TabMe(),
      ];
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
  Widget buildBodyWidget(BuildContext context) {
    return Stack(
      children: [
        _getPagesWidget(0),
        _getPagesWidget(1),
        _getPagesWidget(2),
      ],
    );
  }

  @override
  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      items: getNavTitles(),
      onTap: (int index) {
        print('当前tab索引=> ${index}');
        eventBus.fire(TabChangeEvent(index));
        setState(() {
          _selectIndex = index;
        });
      },
      // iconSize: 26, //图标大小
      currentIndex: _selectIndex,
      selectedItemColor: ThemeColors.accentColor,
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: ThemeColors.accentColor),
      unselectedItemColor: ThemeColors.labelLightColor,
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: ThemeColors.labelLightColor),

      type: BottomNavigationBarType.fixed,
    );
  }

  getNavTitles() {
    if (itemList == null) {
      var itemNames = [
        Tuple2<String, String>(S.current.wallet, "icon_wallet.png"),
        Tuple2<String, String>(S.current.community, "icon_community.png"),
        Tuple2<String, String>(S.current.mine, "icon_mine.png"),
      ];
      this.itemList = itemNames
          .map((item) => BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  ImageHelper.wrapAssets(item.item2),
                  color: ThemeColors.labelLightColor,
                  width: 32.0,
                  height: 32.0,
                ),
                activeIcon: Image.asset(ImageHelper.wrapAssets(item.item2),
                    color: ThemeColors.accentColor, width: 35.0, height: 35.0),
                title: Text(item.item1),
              ))
          .toList();
    }
    return itemList;
  }
}
