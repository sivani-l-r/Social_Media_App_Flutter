import 'package:flutter/material.dart';
import 'package:social_media_app/components/drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: DrawerWidget(),
    );
  }
}