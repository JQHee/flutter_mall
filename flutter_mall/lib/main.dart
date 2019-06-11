import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/index_page.dart';
import 'package:flutter_mall/provide/counter.dart';
import 'package:provide/provide.dart';


// 源码：https://github.com/shenghy/flutter_shop
// 序列教程： https://www.cnblogs.com/wangjunwei/tag/flutter/
// json to dart模型: https://javiercbk.github.io/json_to_dart/
// 2019-06-10 -> 20

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
  var providers = Providers();
 
  providers
    ..provide(Provider<Counter>.value(counter));

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IndexPage()
    );
  }
}
