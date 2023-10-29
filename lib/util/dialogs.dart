import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> ImageByBreed(BuildContext context, Function function, TextEditingController ctr) {
  return showDialog<void>(
    context: context,

    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(255, 218, 219, 1),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          color: const Color.fromRGBO(64, 0, 15, 1),
        ),
        title: const Text(
          'Enter breed',
        ),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: TextField(
                  controller: ctr,
                  decoration:const InputDecoration(
                    hintText: "Breed",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: const Color.fromRGBO(141, 16, 47, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(64, 0, 15, 0.5),
                splashFactory: InkRipple.splashFactory),
            child: Text(
              'Approve',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: const Color.fromRGBO(64, 0, 15, 1),
              ),
            ),
            onPressed: () {
              function(ctr.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> ImageByBreedAndSubBreed(
    BuildContext context, Function function, TextEditingController ctr1, TextEditingController ctr2) {
  return showDialog<void>(
    context: context,

    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(255, 218, 219, 1),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          color: const Color.fromRGBO(64, 0, 15, 1),
        ),
        title: const Text(
          'Enter breed',
        ),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: TextField(
                  controller: ctr1,
                  decoration: const InputDecoration(
                    hintText: "Breed",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: const Color.fromRGBO(141, 16, 47, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextField(
                  controller: ctr2,
                  decoration: const InputDecoration(
                    hintText: "Sub Breed",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: const Color.fromRGBO(141, 16, 47, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Color.fromRGBO(255, 178, 184, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(64, 0, 15, 0.5),
                splashFactory: InkRipple.splashFactory),
            child: Text(
              'Approve',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: const Color.fromRGBO(64, 0, 15, 1),
              ),
            ),
            onPressed: () {
              function(ctr1.text, ctr2.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
