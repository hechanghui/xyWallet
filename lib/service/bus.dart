
//全局事件总线
//对于简单的app，事件总线已经足够满足需求，引入全局状态管理会增加负担

//事件总线通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色，可以通过事件总线来触发事件和监听事件，

//Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，这样就可以保证new EventBus()始终返回都是同一个实例，读者应该理解并掌握这种方法。

import 'package:event_bus/event_bus.dart';
/// 创建EventBus
EventBus eventBus = EventBus();


/// tab页面切换通知
class TabChangeEvent{
  int index = 0;
  TabChangeEvent(this.index);
}

