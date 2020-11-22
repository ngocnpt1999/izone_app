import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MemberDetailView extends StatelessWidget {
  MemberDetailView(this._imagesUri);

  final List<String> _imagesUri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: PageView.builder(
        itemCount: _imagesUri.length,
        itemBuilder: (context, index) => Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: _imagesUri[index],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
