import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/nowifi.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          const Positioned(
            bottom: 230,
            left: 30,
            child: Text(
              'THe EnD',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            bottom: 170,
            left: 30,
            child: Text(
              'Oops! Chek your Internet Connection\t:0',
              style: TextStyle(
                color: Colors.white54,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          // Positioned(
          //   bottom: 100,
          //   left: 30,
          //   right: 250,
          //   child: ReusablePrimaryButton(
          //     childText: 'Home',
          //     buttonColor: Colors.white,
          //     childTextColor: Colors.black,
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
