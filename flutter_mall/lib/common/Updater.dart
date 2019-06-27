import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 * app版本更新
 */

class Updater extends StatefulWidget {

  final Widget child;

  const Updater({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdaterState();
  }
}

class _UpdaterState extends State<Updater> {


  @override
  void initState() {
    // TODO: implement initState
     // _checkForUpdates();
    super.initState();
  }

  Widget _buildDialog(BuildContext context, String updateUrl, String versionShort) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);
    return CupertinoAlertDialog(
      title: Text('是否立即更新${'应用名称'}?'),
      content: Text('检测到新版本 v$versionShort', style: dialogTextStyle),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('下次再说'),
          onPressed: () => {
             Navigator.pop(context, false)
          },
        ),
        CupertinoDialogAction(
          child: const Text('立即更新'),
          onPressed: () => {
             Navigator.pop(context, true)
          },
        ),
      ],
    );
  }

  _getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }

  Future<void> _checkForUpdates() async {

    SharedPreferences prefs = null;
    try {
      prefs = await SharedPreferences.getInstance();
    }catch(e) {
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    // 获取下载地址（商店的下载地址）
    String updateUrl = Theme.of(context).platform == TargetPlatform.iOS ? 'iOS' : 'android';
    String updateTime = prefs.getString('updateTime') ?? null; /// 一天之内只提醒一次需要更新    
    if (updateTime != null && DateTime.parse(updateTime).day == DateTime.now().day) { 
      return;
    }
    try { 
      Response response = await Dio().get(updateUrl); 
      String versionShort = response.data['versionShort'];
      if (version.hashCode != versionShort.hashCode) { 
        final bool wantsUpdate = await showDialog<bool>( 
          context: context, 
          builder: (BuildContext context) => _buildDialog(context, response.data['update_url'], versionShort), barrierDismissible: false,);
          if (wantsUpdate != null && wantsUpdate) { 
            prefs.remove('updateTime'); 
            // 跳转到外部网站
            launch(response.data['update_url'],forceSafariVC: false,);
          } else { 
            prefs.setString('updateTime', DateTime.now().toString());
          }
        }
      } catch (e) {}
  }

}