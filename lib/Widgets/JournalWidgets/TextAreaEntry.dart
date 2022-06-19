import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TextAreaEntry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextAreaEntryState();
}

class _TextAreaEntryState extends State<TextAreaEntry> {
  List<Container> _entrys = [];
  Container _createNewContainer() {
    return Container(
      child: Column(children: [
        TextFormField(
          minLines: 1,
          maxLines: 1,
          maxLength: 35,
          keyboardType: TextInputType.text,
          initialValue: "Title",
          style: const TextStyle(
            color: Colors.black54,
          ),
          decoration: InputDecoration(fillColor: Colors.white, filled: true),
        ),
        TextFormField(
          minLines: 20,
          maxLines: 20,
          maxLength: 1100,
          keyboardType: TextInputType.multiline,
          initialValue: "Write something here",
          style: TextStyle(color: Colors.black45),
          decoration: InputDecoration(fillColor: Colors.white, filled: true),
        ),
      ]),
    );
  }

  void _addNewEntryEvent() {
    setState(() {
      _entrys.add(_createNewContainer());
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_entrys.length);
    return Container(
      child: Column(children: [
        Row(
          children: [
            const Text(
              "Entry",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Expanded(child: SizedBox.shrink()), // <-- Expanded
            TextButton(
                onPressed: () => {_addNewEntryEvent()},
                child: const Text("Add  Entry"))
          ],
        ),
        CarouselSlider(
            items: _entrys,
            options: CarouselOptions(
                height: 600, autoPlay: false, disableCenter: true,enableInfiniteScroll: false,enlargeCenterPage: true,
                ))
      ]),
    );
  }
}
