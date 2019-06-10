import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 *  首页店长电话模块
 */

class HomeLeaderPhone extends StatefulWidget {

  final String leaderImage;
  final String leaderPhone;

  const HomeLeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeLeaderPhoneState();
  }

}

class _HomeLeaderPhoneState extends State<HomeLeaderPhone> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(widget.leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel' + widget.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url 不能访问，异常';
    }

  }

}