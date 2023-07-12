import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../models/watchlist_model.dart';
import '../../widgets/text_widget.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.conlist});
  final WatchListModel conlist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: five,
      ),
      child: Container(
        height: fifty,
        decoration: BoxDecoration(
            color: whitecolor,
            border: Border.all(color: greycolor, width: pointtwo),
            borderRadius: const BorderRadius.all(Radius.circular(five))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: int.parse(four.toString()),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: ten, right: ten, top: fifteen),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        textString: conlist.name.toString().toUpperCase(),
                        color: blackcolor,
                        fontWeight: boldfont,
                        fontSize: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: five, bottom: five),
                        child: TextWidget(
                          fontSize: 8,
                          textString: conlist.contacts.toString(),
                          color: greycolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(eight),
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
