import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderDescriptionPage extends StatefulWidget {
  @override
  _OrderDescriptionPageState createState() => _OrderDescriptionPageState();

  final PageController pageController;
  final TextEditingController descriptionController;

  OrderDescriptionPage({this.pageController, this.descriptionController});
}

class _OrderDescriptionPageState extends State<OrderDescriptionPage> {
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    widget.descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Wat heb je nodig?",
          subtitle: "Beschrijf het hier en we gaan het voor je halen!",
        ),
        buildDescriptionField(),
        buildNextButton(context),
      ],
    );
  }

  Widget buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ExpandedButton(
            text: "Volgende",
            function: widget.descriptionController.text.isEmpty
                ? null
                : () => widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionField() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: widget.descriptionController,
              decoration: InputDecoration(
                labelText: "Beschrijving",
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(20.0),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              expands: true,
              maxLines: null,
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: _image == null
                  ? FloatingActionButton(
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Theme.of(context).canvasColor,
                      ),
                      onPressed: getImage,
                    )
                  : InkWell(
                      onTap: () => deleteImage(),
                      borderRadius: BorderRadius.circular(300.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    PickedFile pickedFile;

    await showDialog(
      context: context,
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Make a photo"),
              leading: Icon(Icons.image),
              onTap: () async {
                pickedFile = await picker.getImage(source: ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            Divider(height: 0),
            ListTile(
              title: Text("Pick from gallery"),
              leading: Icon(Icons.camera_alt),
              onTap: () async {
                pickedFile = await picker.getImage(source: ImageSource.gallery);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  deleteImage() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Delete the image?"),
        actions: [
          FlatButton(
            child: Text("No"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              setState(() {
                _image = null;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
