import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/presentation/views/home/widgets/app_body.dart';
import 'package:movie_app_v1/src/presentation/widgets/drawer_menu_button.dart';
import 'package:movie_app_v1/src/presentation/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        Fluttertoast.showToast(
            msg: "Фотография не выбрана",
            // toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: AppColors.notblack,
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 140,
        actions: const [
          DrawerMenuButton(),
        ],
        backgroundColor: AppColors.notblack,
        title: Row(
          children: [
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    await getImage();
                    setState(() {});
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: _image == null
                        ? const AssetImage('assets/images/welcomeLogo.jpg')
                        : FileImage(_image!) as ImageProvider,
                  ),
                ),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 9),
            AutoSizeText(
              'Welcome back \n user',
              style: TextStyle(color: AppColors.white, fontFamily: 'Axiforma'),
              maxLines: 4,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: const AppBody(),
      ),
    );
  }
}
