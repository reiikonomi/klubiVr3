// @dart = 2.9
// ignore_for_file: missing_required_param

import 'dart:convert';

//import 'package:klubivr3/CustumWidget/overlay_card.dart';
import 'package:klubivr3/Model/add_blog_models.dart';
import 'package:klubivr3/network_handler.dart';
import 'package:klubivr3/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile _imageFile;
  IconData iconphoto = Icons.image;
  NetworkHandler networkHandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        // actions: <Widget>[
        //   //TextButton(child: Text('Preview'), onPressed: () => OverlayCard(imagefile: _imageFile, title: _title),),
        // ],
      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget>[
            choosePhoto(),
            titleTextField(),
            bodyTextField(),
            const SizedBox(
              height: 20,
            ),
            addButton(),
            const Padding(
              padding:  EdgeInsets.all(15),
              child: Center(
                child:  Text(
                    ''),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget choosePhoto() {
    return GestureDetector(
        onTap: () {
          takeCoverPhoto();
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
          ),
          height: 100,
          width: 100,
          child: Icon(
            iconphoto,
            size: 40,
            color: Colors.black,
          ),
        )

        // : OverlayCard(
        //     imagefile: _imageFile,
        //     title: _title.text,
        //   )
        // child: if (_imageFile.path != null) {
        //     OverlayCard(
        //       imagefile: _imageFile,
        //       title: _title.text,
        //     );
        //   } else {
        //     Container(
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.rectangle,
        //         color: Colors.transparent,
        //       ),
        //       height: 100,
        //       width: 100,
        //       child: const Icon(
        //         Icons.add_a_photo_outlined,
        //         size: 40,
        //         color: Colors.black,
        //       ),
        //     );
        //   },
        // child: Container(
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.rectangle,
        //     color: Colors.transparent,
        //   ),
        //   height: 100,
        //   width: 100,
        //   child: const Icon(
        //     Icons.add_a_photo_outlined,
        //     size: 40,
        //     color: Colors.black,
        //   ),
        // ),
        );
  }

  Widget titleTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: _title,
        validator: (value) {
          if (value.isEmpty) {
            return "Title can't be empty";
          } else if (value.length > 100) {
            return "Title length should be <=100";
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          labelText: "Add Title",
          labelStyle: TextStyle(color: Colors.black),
          //labelStyle:
          // prefixIcon: IconButton(
          //   icon: Icon(
          //     iconphoto,
          //     color: Colors.deepOrange,
          //   ),
          //   onPressed: takeCoverPhoto,
          // ),
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget bodyTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: _body,
        validator: (value) {
          if (value.isEmpty) {
            return "Body can't be empty";
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          labelText: "Provide Body to Your Post",
          labelStyle: TextStyle(color: Colors.black),
        ),
        maxLines: null,
      ),
    );
  }

  Widget addButton() {
    return InkWell(
      onTap: () async {
        if (_imageFile != null && _globalkey.currentState.validate()) {
          AddBlogModel addBlogModel =
              AddBlogModel(body: _body.text, title: _title.text);
          var response = await networkHandler.post1(
              "/blogpost/Add", addBlogModel.toJson());
          //print(response.body);

          if (response.statusCode == 200 || response.statusCode == 201) {
            String id = json.decode(response.body)["data"];
            var imageResponse = await networkHandler.patchImage(
                "/blogpost/add/coverImage/$id", _imageFile.path);
            //print(imageResponse.statusCode);
            if (imageResponse.statusCode == 200 ||
                imageResponse.statusCode == 201) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            }
          }
        }
      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: const Center(
              child: Text(
            "Add Post",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  void takeCoverPhoto() async {
    final coverPhoto = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = coverPhoto;
      iconphoto = Icons.check_box;
    });
  }
}
