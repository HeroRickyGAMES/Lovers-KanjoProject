import 'package:flutter/material.dart';

class MainTelaRoleta extends StatefulWidget {
  const MainTelaRoleta({super.key});

  @override
  State<MainTelaRoleta> createState() => _MainTelaRoletaState();
}

class _MainTelaRoletaState extends State<MainTelaRoleta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanjo - Encontre alguém especial!'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
