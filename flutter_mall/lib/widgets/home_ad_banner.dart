import 'package:flutter/material.dart';

/**
 * 首页广告
 */
class HomeAdBanner extends StatefulWidget {

  final String adPicture;

  const HomeAdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeAdBanner();
  }

}

class _HomeAdBanner extends State<HomeAdBanner> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.network(widget.adPicture),
    );
  }


}