import 'package:flutter/material.dart';

class NotFound404Error extends StatelessWidget {
  const NotFound404Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/404_error.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
         const Positioned(
            bottom: 230,
            left: 30,
            child: Text(
              'Dead End',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        const  Positioned(
            bottom: 170,
            left: 30,
            child: Text(
              'Oops! The page you are looking for\nis not found',
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
