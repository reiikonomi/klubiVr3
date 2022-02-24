// @dart = 2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OverlayCard extends StatelessWidget {
  const OverlayCard({Key key, this.imagefile, this.title}) : super(key: key);
  final PickedFile imagefile;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
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
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'username',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: FileImage(
                    File(imagefile.path),
                  ),
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
                const Text(
                  'username',
                  style: TextStyle(color: Colors.white),
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
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                const Text(
                  '...',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
    // return Container(
    //   height: 200,
    //   padding: const EdgeInsets.all(5),
    //   width: MediaQuery.of(context).size.width,
    //   child: Stack(
    //     children: <Widget>[
    //       Container(
    //         height: MediaQuery.of(context).size.height,
    //         width: MediaQuery.of(context).size.width,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //               image: FileImage(
    //                 File(imagefile.path),
    //               ),
    //               fit: BoxFit.fitWidth),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 2,
    //         child: Container(
    //           padding: const EdgeInsets.all(8),
    //           height: 55,
    //           width: MediaQuery.of(context).size.width,
    //           decoration: BoxDecoration(
    //               color: Colors.white, borderRadius: BorderRadius.circular(8)),
    //           child: Text(
    //             title,
    //             style: const TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 15,
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
