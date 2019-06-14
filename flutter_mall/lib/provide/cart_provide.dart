import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mall/models/cart_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProvide with ChangeNotifier {
  String cartString = '[]';
  List <CartInfo> cartList = [];

  // 计算总价格和商品总数
  double allPrice = 0; // 总价格
  int allGoodsCount = 0; // 商品总数
  bool isAllCheck=true;//全选 默认true

  // 声明一个异步方法，购物车操作放在前台不再请求后台数据
  save(goodsId, goodsName, count, price, images) async {
        SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {

    } 
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();

    // 是否存在
    bool isHave = false;
    int iVal = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[iVal]['count'] = item['count'] + 1;
        cartList[iVal].count++;
        isHave = true;
      }
      iVal++;
    }); 

    // 如果不存在这个商品
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck':true // 默认选中
      };
      tempList.add(newGoods);
      cartList.add(CartInfo.fromJson(newGoods));
      allPrice+= (count * price);
      allGoodsCount+=count;
    }

    cartString = json.encode(tempList).toString();
    print(cartString);
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  // 数据清空
  remove() async {
    SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {

    } 
    prefs.remove('cartInfo');
    cartList = [];
    print('清空完成');
    notifyListeners();
  }

// 购物车数据
  getCartInfo() async{
    SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {

    } 
    //获得购物车中的商品,这时候是一个字符串
     cartString=prefs.getString('cartInfo'); 
     
     //把cartList进行初始化，防止数据混乱 
     cartList=[];
     //判断得到的字符串是否有值，如果不判断会报错
     if(cartString==null){
       cartList=[];
     }else{
       List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
       allPrice=0;
       allGoodsCount=0;
       isAllCheck=true;
       tempList.forEach((item){
        
          if(item['isCheck']){
             allPrice+=(item['count']*item['price']);
             allGoodsCount+=item['count'];
          }else{
            isAllCheck=false;
          }
         
          cartList.add(new CartInfo.fromJson(item));

       });

     }
      notifyListeners();
  }

  // 删除单个购物车商品
  deleteOneGoods(String goodsId) async{
        SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {

    }
    cartString=prefs.getString('cartInfo');
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();
    int tempIndex=0;//定义循环的索引
    int deleteIndex=0;//要删除的索引
    tempList.forEach((item){
      if(item['goodsId']==goodsId){
        deleteIndex=tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(deleteIndex);//删除
    //删除后转换成string进行持久化
    cartString=json.encode(tempList).toString();//list转字符串
    prefs.setString('cartInfo', cartString);
    await getCartInfo();//重新获取下列表数据，因为getCartInfo方法里面有通知，这里就不再调用了
  }

  // 点击全选按钮操作
  changeAllCheckBtnState(bool isCheck) async{
        SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {

    }
    cartString=prefs.getString('cartInfo');
    List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
    List<Map> newList=[];//这里必须初始化为[]声明为一个空的值
    
    for(var item in tempList)
    {
      //dart在循环的时候是不允许改变老的值的
      var newItem=item;//把老的item赋值给新的item
      newItem['isCheck']=isCheck;
      newList.add(newItem);
    }

    cartString=json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);

    await getCartInfo();//最后中心获取一下购物车的列表数据
  }


  //商品数量加减
  addOrReduceAction(var cartItem,String todo) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo');
    List<Map> tempList=(json.decode(cartString.toString()) as List).cast();
    int tempIndex=0;//循环的索引
    int changeIndex=0;//要改变的索引
    tempList.forEach((item){
      if(item['goodsId']==cartItem.goodsId){
        changeIndex=tempIndex;
      }
      tempIndex++;
    });
    if(todo=='add'){
      cartItem.count++;
    }else if(cartItem.count>1){
      cartItem.count--;//数量只有大于1才能减减
    }

    tempList[changeIndex]=cartItem.toJson();
    cartString=json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);

    await getCartInfo();//重新获取购物车数据
  }

}