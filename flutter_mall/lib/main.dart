import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/index_page.dart';
import 'package:flutter_mall/provide/cart_provide.dart';
import 'package:flutter_mall/provide/current_index_provide.dart';

// provide
import 'package:provide/provide.dart';
import 'package:flutter_mall/provide/counter.dart';
import 'package:flutter_mall/provide/category_child_provide.dart';
import 'package:flutter_mall/provide/category_goods_list_provide.dart';
import 'package:flutter_mall/provide/goods_info_provide.dart';

// 路由
import 'package:fluro/fluro.dart';
import 'package:flutter_mall/routers/application.dart';
import 'package:flutter_mall/routers/routers.dart';


// 源码：https://github.com/shenghy/flutter_shop
// 序列教程： https://www.cnblogs.com/wangjunwei/tag/flutter/
// 一些常用的库：https://www.cnblogs.com/yangyxd/p/9232308.html
// 当前进度：2019-06-10 -> 63 
// 已学习：1~40 64~66
// 总：66
// json to dart模型: https://javiercbk.github.io/json_to_dart/

/* Provide 全局配置
void main(){
  var childCategory= ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var detailsInfoProvide= DetailsInfoProvide();
  var cartProvide  =CartProvide();
  var currentIndexProvide  =CurrentIndexProvide();
  var counter =Counter();
  var providers  =Providers();
 
  providers
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<Counter>.value(counter));

  runApp(ProviderNode(child:MyApp(),providers:providers));
}
*/

void main() {
  var counter = Counter();
  var categoryChild = CategoryChildProvide();
  var categoryGoodsList = CategoryGoodsListProvide();
  var goodsInfo = GoodsInfoProvide();
  var cart = CartProvide();
  var currentIndex = CurrentIndexProvide();

  var router = Router(); 
  Routers.configurreRoutes(router);
  Application.router = router;

  var providers = Providers();
 
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndex))
    ..provide(Provider<CartProvide>.value(cart))
    ..provide(Provider<GoodsInfoProvide>.value(goodsInfo))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList))
    ..provide(Provider<CategoryChildProvide>.value(categoryChild));

  runApp(
    ProviderNode(
      child:MyApp(),
      providers:providers
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '百姓生活+',
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IndexPage()
    );
  }
}
