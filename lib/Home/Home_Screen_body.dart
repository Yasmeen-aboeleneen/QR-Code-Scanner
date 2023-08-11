import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 45,
        ),
        Center(
          child: Column(
            children: [
              Image.asset(
                'Assets/Images/picc.jpg',
                width: 240,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              child: const Text('Create QR code'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 88, 125, 117),
                  side: const BorderSide(color: Colors.orange, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              child: const Text('Scan QR code'),
            )
          ],
        )
      ]),
    );
  }
}
