import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/helper/popup_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/provider/view_state_model.dart';
import 'package:xy_wallet/common/provider/view_state_widget.dart';
import 'package:xy_wallet/model/event/message_event.dart';
import 'package:xy_wallet/view_model/base_load_data_vm.dart';
import 'common_function.dart';

import 'NavigatorManger.dart';

import 'package:xy_wallet/ui/base/base_page.dart';

abstract class BaseWidget extends StatefulWidget {
  // BaseWidgetState baseWidgetState;
  @override
  BaseWidgetState createState() {
    // baseWidgetState = getState();
    return getState();
  }

  BaseWidgetState getState();
  // String getStateName() {
  //   return baseWidgetState.getWidgetName();
  // }
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    with WidgetsBindingObserver, BaseFuntion, BasePageMixin {
  //平台信息
//  bool isAndroid = Platform.isAndroid;

  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记
  StreamSubscription _eventBusSubscription;
  BuildContext _context;

  @mustCallSuper
  @override
  void initState() {
    initBaseCommon(this);
    NavigatorManger().addWidget(this);
    WidgetsBinding.instance.addObserver(this);
    onCreate();
    if (mounted) {}

    super.initState();
    print('initState1');

    _regEventBus();
  }

  @override
  Widget build(BuildContext context) {
    if (!_onResumed) {
      //说明是 初次加载
      if (NavigatorManger().isTopPage(this)) {}
      _onResumed = true;
      onResume();
    }
    return buildPageContainer(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String classname = getClassName();
    print('${classname} 加载完成');
    _context = context;
  }

  @override
  void didUpdateWidget(BaseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // hideInputKeyboard(context);
    String classname = getClassName();
    print('${classname} didUpdateWidget');
  }

  @override
  void deactivate() {
    hideInputKeyboard(context);
    String classname = getClassName();
    print('${classname} deactivate');

    //说明是被覆盖了
    if (NavigatorManger().isSecondTop(this)) {
      if (!_onPause) {
        onPause();
        _onPause = true;
      } else {
        onResume();
        _onPause = false;
      }
    } else if (NavigatorManger().isTopPage(this)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
  }

  @override
  Widget buildBody(BuildContext context) {
    return buildBodyWithStatus(context);
  }

  @override
  void dispose() {
    String classname = getClassName();
    print('${classname} 销毁');

    onDestory();
    WidgetsBinding.instance.removeObserver(this);
    _onResumed = false;
    _onPause = false;

    //把改页面 从 页面列表中 去除
    NavigatorManger().removeWidget(this);
    
    // //取消网络请求
    // HttpManager.cancelHttp(getWidgetName());
    hideInputKeyboard(_context);
    _eventBusSubscription?.cancel();
    _context = null
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState');
    //此处可以拓展 是不是从前台回到后台
    if (state == AppLifecycleState.resumed) {
      //on resume
      if (NavigatorManger().isTopPage(this)) {
        onForeground();
        onResume();
      }
    } else if (state == AppLifecycleState.paused) {
      //onpause
      if (NavigatorManger().isTopPage(this)) {
        onBackground();
        onPause();
      }
    }
    super.didChangeAppLifecycleState(state);
    print('didChangeAppLifecycleState');
  }

  @override
  void onCreate() {
    String classname = getClassName();
    print('${classname}创建');
  }

  @override
  void onPause() {
    String classname = getClassName();
    print('${classname}onPause');
  }

  @override
  void onResume() {
    String classname = getClassName();
    print('${classname}onResume');
  }

  void _regEventBus() {
    _eventBusSubscription = eventBus.on().listen((event) {
      if (!_onPause) {
        if (event is LoadingPopupEvent) {
          if (event.isShow) {
            showLoading(msg: event.msg, canCancel: event.canCancel);
          } else {
            hideLoading();
          }
        }
      }
    });
  }
}

abstract class BaseLoadDataWidgetState<T extends BaseWidget,
    VM extends BaseLoadDataViewModel> extends BaseWidgetState<T> {
  VM onCreateViewModel();

  @override
  Widget buildBody(BuildContext context) {
    return ProviderWidget<VM>(
      model: onCreateViewModel(),
      builder: (context, model, child) {
        switch (model.viewState) {
          case ViewState.busy:
            model.loadData();
            return ViewStateBusyWidget();
          case ViewState.empty:
            return ViewStateEmptyWidget(
              onPressed: () {
                model.loadData();
              },
            );
          case ViewState.error:
            return ViewStateErrorWidget(
              error: model.viewStateError,
              onPressed: () {
                model.loadData();
              },
            );
          default:
            return buildBodyWidget(context);
        }
      },
    );
  }
}
