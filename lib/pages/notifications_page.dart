import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Notifications page"),
        ),
        body: SizedBox.expand(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 24,
              itemBuilder: (_, index) {
                return itemList(index.toString());
              }),
        ));
  }

  Widget itemList(String index) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10),
      height: 100.0,
      child: Center(
        child: Text(
          "Notification $index",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
