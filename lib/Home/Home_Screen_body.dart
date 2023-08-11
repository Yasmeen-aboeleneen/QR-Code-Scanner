import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
   body: Container(
    height: double.infinity,
    width: double.infinity,
     child: Stack(
           children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'Assets/Images/s_top.png',
                  height: 150,
                )),
            
            
             Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'Assets/Images/bottom.png',
                height: 150,
              ),
            ),
           ],
   
   
     ),
   ),




    ));
  }
}
