import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final List<Object> array;
  final Function? ontap;
  const CustomList({Key? key, required this.array, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: ListTile(
                onTap: () {
                  print(array[index]);
                },
                title: Text('${array[index].toString()}'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          },
          itemCount: array.length),
    );
  }
}
