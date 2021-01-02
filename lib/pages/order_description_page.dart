import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shapp/decorations/field_decoration.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/validators.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderDescriptionPage extends StatefulWidget {
  @override
  _OrderDescriptionPageState createState() => _OrderDescriptionPageState();
}

class _OrderDescriptionPageState extends State<OrderDescriptionPage> {
  PageController pageController;
  Order order;
  ImagePicker picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderTitleBlock(
              title:
                  AppLocalizations.of(context).translate("description_title"),
              subtitle: AppLocalizations.of(context)
                  .translate("description_subtitle")),
          buildBody(),
          buildNextButton(context),
        ],
      ),
    );
  }

  Widget buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ExpandedButton(
            text: AppLocalizations.of(context).translate("next"),
            function: () {
              if (_formKey.currentState.validate()) {
                pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [buildDescriptionField(), buildImageButton()],
        ),
      ),
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      decoration: fieldDecoration(
          labelText: AppLocalizations.of(context).translate("description")),
      keyboardType: TextInputType.multiline,
      expands: true,
      maxLines: null,
      onChanged: (text) => setState(() => order.description = text),
      initialValue: order.description,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => emptyValidator(value, AppLocalizations.of(context).translate("description_required")),
    );
  }

  Positioned buildImageButton() {
    return Positioned(
      right: 20,
      bottom: 20,
      child: order.image == null
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
                  order.image,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
    );
  }

  Future getImage() async {
    PickedFile pickedFile;

    await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context).translate("make_photo")),
              leading: Icon(Icons.image),
              onTap: () async {
                pickedFile = await picker.getImage(source: ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            Divider(height: 0),
            ListTile(
              title:
                  Text(AppLocalizations.of(context).translate("pick_gallery")),
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
      if (pickedFile != null) order.image = File(pickedFile.path);
    });
  }

  deleteImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context).translate("delete_image")),
        content: Image.file(order.image),
        actions: [
          FlatButton(
            child: Text(AppLocalizations.of(context).translate("no")),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).translate("yes")),
            onPressed: () {
              setState(() {
                order.image = null;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
