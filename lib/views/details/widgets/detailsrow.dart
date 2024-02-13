import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/helpers/colors.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow(
      {super.key,
      required this.size,
      required this.value1,
      required this.value2,
      required this.head1,
      required this.width,
      required this.head2});

  final Size size;
  final String value1;
  final String value2;
  final String head1;
  final String head2;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  head1,
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: fontcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Container(
                  width: width,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: extrabgcolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      value1,
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: fontcolor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  head2,
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: fontcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Container(
                  width: size.width * 0.18,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: extrabgcolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      value2,
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: fontcolor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
