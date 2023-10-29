import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/dialogs.dart';

class MyBox extends StatelessWidget {
  Data data;

  MyBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController ctr1 = TextEditingController();
    TextEditingController ctr2 = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(255, 218, 219, 1),
        ),
        child: InkWell(
          onTap: () {
            if (data.subBreed) {
              ImageByBreedAndSubBreed(context, data.function, ctr1, ctr2);
            } else {
              ImageByBreed(context, data.function, ctr1);
            }
          },
          splashColor: Color.fromRGBO(255, 218, 219, 1),
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: data.icon,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                data.title,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: const Color.fromRGBO(64, 0, 15, 1),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
