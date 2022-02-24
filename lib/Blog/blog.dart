// ignore: import_of_legacy_library_into_null_safe
import 'package:klubivr3/Model/add_blog_models.dart';
//import 'package:klubivr3/Model/profile_model.dart';
import 'package:klubivr3/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class Blog extends StatelessWidget {
  const Blog({
    Key? key,
    required this.addBlogModel,
    required this.networkHandler,
  }) : super(key: key);
  final AddBlogModel addBlogModel;
  final NetworkHandler networkHandler;
  // final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(addBlogModel.username),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              final imageProvider = networkHandler.getImage(addBlogModel.id);
              showImageViewer(context, imageProvider, onViewerDismissed: () {});
            },
            child: Card(
              color: Colors.transparent,
              elevation: 5,
              child: Container(
                //child: networkHandler.getImage(addBlogModel.id),
                height: MediaQuery.of(context).size.width * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: networkHandler.getImage(addBlogModel.id),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage:
                      networkHandler.getImage(addBlogModel.username),
                  backgroundColor: Colors.white,

                  // child: Image.network(
                  //   baseurl + '/' + addBlogModel.username + '.jpg',
                  //   fit: BoxFit.cover,
                  // )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: Text(
                  "@${addBlogModel.username}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                ':',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  addBlogModel.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              addBlogModel.body,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )

          // SizedBox(
          //   height: MediaQuery.of(context).size.width,
          //   width: MediaQuery.of(context).size.width,
          //   child: Card(
          //     elevation: 8,
          //     child: Column(
          //       children: [
          //         Container(
          //           height: 230,
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: networkHandler.getImage(addBlogModel.id),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 20, vertical: 10),
          //           child: Text(
          //             addBlogModel.title,
          //             style: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 20, vertical: 10),
          //           child: Row(
          //             children: [
          //               const Icon(
          //                 Icons.chat_bubble,
          //                 size: 18,
          //               ),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               Text(
          //                 addBlogModel.comment.toString(),
          //                 style: const TextStyle(fontSize: 15),
          //               ),
          //               const SizedBox(
          //                 width: 15,
          //               ),
          //               const Icon(
          //                 Icons.thumb_up,
          //                 size: 18,
          //               ),
          //               const SizedBox(
          //                 width: 8,
          //               ),
          //               Text(
          //                 addBlogModel.count.toString(),
          //                 style: const TextStyle(fontSize: 15),
          //               ),
          //               const SizedBox(
          //                 width: 15,
          //               ),
          //               const Icon(
          //                 Icons.share,
          //                 size: 18,
          //               ),
          //               const SizedBox(
          //                 width: 8,
          //               ),
          //               Text(
          //                 addBlogModel.share.toString(),
          //                 style: const TextStyle(fontSize: 15),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: Card(
          //     elevation: 15,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //         vertical: 15,
          //       ),
          //       child: Text(addBlogModel.body),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
