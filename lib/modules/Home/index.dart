import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.white,
                child: Image.asset('assets/logos/todologo.png'),
              ),
              const Padding(padding: EdgeInsets.all(40)),
              const Text(
                "WELCOME",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Press Let's Start to Enjoy with Todo",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.all(50)),
              FloatingActionButton.extended(
                onPressed: () {
                  Get.toNamed('security');
                },
                label: const Icon(Icons.arrow_forward_ios),
                icon: const Text("Let's Start"),
                backgroundColor: Colors.pink,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
