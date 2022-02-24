// @dart = 2.9
import 'package:klubivr3/Blog/blogs.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:klubivr3/network_handler.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  // GlobalKey<LiquidPullToRefreshState>();
  // ignore: unused_field
  ScrollController _scrollController;

  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  String baseurl = "https://klubiprogramimit.herokuapp.com";
  var log = Logger();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> get() async {
    // String url;
    // String token = await storage.read(key: "token");
    // url = formater(url);
    // // /user/register
    // var response = await http.get(
    //   url,
    //   headers: {"Authorization": "Bearer $token"},
    // );
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   log.i(response.body);

    //   return json.decode(response.body);
    // }
    // log.i(response.body);
    // log.i(response.statusCode);
  }

  // String formater(String url) {
  //   return baseurl + url;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LiquidPullToRefresh(
        color: Colors.white,
        backgroundColor: Colors.black,
        showChildOpacityTransition: false,
        onRefresh: get,
        child: const SingleChildScrollView(
          //reverse: true,
          child: Blogs(
            url: "/blogpost/getOtherBlog",
          ),
        ),
      ),
    );
  }
}
