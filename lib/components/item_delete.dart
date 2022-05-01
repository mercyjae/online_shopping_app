import 'package:flutter/material.dart';

class ItemDelete extends StatelessWidget {
  const ItemDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Confirmation"),
      content: const Text("Are you sure you want to delete this item?"),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Delete")
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("Cancel"),
        ),
      ],
    );
}}
