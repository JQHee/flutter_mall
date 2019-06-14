import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/cart_provide.dart';
import 'package:flutter_mall/widgets/cart_bottom.dart';
import 'package:flutter_mall/widgets/cart_item.dart';
import 'package:provide/provide.dart';

/**
 * 购物车
 */

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
           
            List cartList=Provide.value<CartProvide>(context).cartList;
            //return Text('有数据啊'+cartList.length.toString());
             return Stack(
              children: <Widget>[
                  Provide<CartProvide>(
                    builder: (context, child, val) {
                      cartList=Provide.value<CartProvide>(context).cartList;
                      return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context,index){
                          return CartItem(cartList[index]);
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CartBottom(),
                  )
              ],
            );
          }else{
            return Text('正在加载');
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    //print('=========================获取购物车内数据');
    return 'end';
  }


}
