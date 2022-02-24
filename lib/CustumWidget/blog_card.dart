// @dart = 2.9

import 'package:image_picker/image_picker.dart';
import 'package:klubivr3/Model/add_blog_models.dart';
import 'package:klubivr3/network_handler.dart';
import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {Key key, this.addBlogModel, this.networkHandler, this.imageFile})
      : super(key: key);

  final AddBlogModel addBlogModel;
  final NetworkHandler networkHandler;
  final PickedFile imageFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          children: [
            Container(
              color: Colors.black87,
              height: MediaQuery.of(context).size.width * 0.1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      addBlogModel.username,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: networkHandler.getImage(addBlogModel.id),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Colors.black87,
              height: MediaQuery.of(context).size.width * 0.1,
              child: Row(
                children: [
                  const Text(
                    ' ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '@',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    addBlogModel.username,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '  ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    addBlogModel.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return Container(
    //   height: MediaQuery.of(context).size.width * 0.75,
    //   padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    //   width: MediaQuery.of(context).size.width,
    //   child: Card(
    //     child: Stack(
    //       children: <Widget>[
    //         Container(
    //           height: MediaQuery.of(context).size.height,
    //           width: MediaQuery.of(context).size.width,
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //                 image: networkHandler.getImage(addBlogModel.id),
    //                 fit: BoxFit.cover),
    //           ),
    //         ),
    //         Positioned(
    //           bottom: 0,
    //           child: Container(
    //             padding: const EdgeInsets.all(7),
    //             height: 60,
    //             width: MediaQuery.of(context).size.width - 30,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(8)),
    //             child: Text(
    //               addBlogModel.title,
    //               textAlign: TextAlign.center,
    //               style: const TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 15,
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

// Widget imageProfile() {
//   return Center(
//     child: Stack(children: <Widget>[
//       CircleAvatar(
//         radius: 80.0,
//         backgroundImage: _imageFile == null
//             ? const AssetImage("assets/profile.jpeg")
//             : FileImage(File(_imageFile.path)),
//       ),
//       Positioned(
//         bottom: 20.0,
//         right: 20.0,
//         child: InkWell(
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               builder: ((builder) => bottomSheet()),
//             );
//           },
//           child: const Icon(
//             Icons.camera_alt,
//             color: Colors.white,
//             size: 28.0,
//           ),
//         ),
//       ),
//     ]),
//   );
// }
