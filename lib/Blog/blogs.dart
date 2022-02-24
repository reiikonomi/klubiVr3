// @dart = 2.9
import 'package:klubivr3/Blog/blog.dart';
import 'package:klubivr3/CustumWidget/blog_card.dart';
import 'package:klubivr3/Model/super_model.dart';
import 'package:klubivr3/Model/add_blog_models.dart';
import 'package:klubivr3/network_handler.dart' show NetworkHandler;
import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  NetworkHandler networkHandler = NetworkHandler();
  // ignore: missing_required_param
  SuperModel superModel = SuperModel();
  List<AddBlogModel> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(widget.url);
    superModel = SuperModel.fromJson(response);
    setState(() {
      data = superModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Column(
          children: data
              .map((item) => Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => Blog(
                                        addBlogModel: item,
                                        networkHandler: networkHandler,
                                      )));
                        },
                        child: BlogCard(
                          addBlogModel: item,
                          networkHandler: networkHandler,
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                    ],
                  ))
              .toList(),
        )
        : const Center(
            child: Text("We don't have any Blogs Yet"),
          );
  }
}
