import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:responsivedashboard/constants.dart';

class MyTile extends StatelessWidget {
  String link;
  MyTile({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          imageDialog(context, link, true);
        },
        child: Container(
          height: 78,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: OctoImage(
              color: Colors.black12,
              colorBlendMode: BlendMode.darken,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.error,
                color: const Color.fromRGBO(141, 16, 47, 1),
              ),
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                link,
              ),
              progressIndicatorBuilder: (context, progress) {
                return CircularProgressIndicator(
                    color: const Color.fromRGBO(141, 16, 47, 0.4));
              },
            ),
          ),
        ),
      ),
    );
  }
}
