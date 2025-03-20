import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _title = 'Dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title: Text(
        '$_title',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      actions: [
        IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LostPost()),
            // );
          },
          icon: Icon(
            Icons.manage_accounts_outlined,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          iconSize: 32.0,
        ),
      ],
    ),
        body:  Center(child: Text('Dashboard',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),));
  }
}
