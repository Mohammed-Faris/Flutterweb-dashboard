import 'package:flutter/material.dart';
import 'package:web_evaluation/widgets/customswitch.dart';

import '../../constants/app_constants.dart';
import '../../widgets/text_widget.dart';

// ignore: must_be_immutable
class OverlayScreen extends StatelessWidget {
  bool isToggled;

  OverlayScreen({super.key, required this.isToggled});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backcolor,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.only(
            top: thirty, bottom: thirty, left: eighteen, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stockname(),
            const Divider(),
            stockpricedetails(context),
            const Divider(),
            inputchipwidget(),
            pricedetails(context),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 136),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isToggled ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    isToggled ? 'Sell' : 'Buy',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stockname() {
    return TextWidget(
      textString: statebankofindia,
      fontSize: sixteen,
      fontWeight: boldfont,
    );
  }

  Widget stockpricedetails(context) {
    return Padding(
      padding: const EdgeInsets.only(top: twenty, bottom: twenty),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    textString: sbin,
                    fontSize: fourteen,
                    fontWeight: boldfont,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: four),
                    child: TextWidget(
                      textString: nse,
                      fontSize: ten,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: eight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      textString: stkprice,
                      fontSize: fourteen,
                      fontWeight: boldfont,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: four),
                      child: TextWidget(
                        textString: stkpricechanges,
                        fontSize: fourteen,
                        fontWeight: boldfont,
                        color: greencolor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomSwitch(
            isToggled: isToggled,
            value: true,
            activeText: sell,
            inactiveText: buy,
            activeTextColor: secondarycolor,
            inactiveTextColor: secondarycolor,
            activeColor: redcolor,
            inactiveColor: greencolor,
            onChanged: (bool value) {},
          ),
        ],
      ),
    );
  }

  inputchipwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          textString: product,
          fontSize: ten,
          color: greycolor,
        ),
        Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 15.0,
            children: List.generate(
                four.toInt(),
                (index) => Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 0, right: 0),
                      child: ChoiceChip(
                        side: BorderSide.none,
                        backgroundColor: whitecolor,
                        label: TextWidget(
                          textString: overlayproduct[index],
                          fontSize: fourteen,
                          color: zero == index ? whitecolor : greycolor,
                        ),
                        selectedColor: deeppurple,
                        selected: zero == index,
                        onSelected: (bool selected) {},
                      ),
                    )).toList()),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextWidget(
              textString: paytodp,
              fontSize: ten,
              color: greycolor,
            ),
          ],
        )
      ],
    );
  }

  pricedetails(context) {
    return Padding(
      padding: const EdgeInsets.only(top: twenty),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: const TextWidget(
                    textString: quantity, fontSize: ten, color: greycolor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: ten),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        textString: price,
                        fontSize: ten,
                        color: greycolor,
                      ),
                      TextWidget(
                          textString: mktPrice,
                          fontSize: ten,
                          color: greycolor),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: ten),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldOverlayWidget(),
                Padding(
                  padding: EdgeInsets.only(left: ten),
                  child: TextFieldOverlayWidget(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: thirty),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: const TextWidget(
                      textString: disclosedqty,
                      fontSize: ten,
                      color: greycolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: ten),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: const TextWidget(
                        textString: stplosstriggerprice,
                        fontSize: ten,
                        color: greycolor),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: ten),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldOverlayWidget(),
                Padding(
                  padding: EdgeInsets.only(left: ten),
                  child: TextFieldOverlayWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldOverlayWidget extends StatelessWidget {
  const TextFieldOverlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 35,
        width: MediaQuery.of(context).size.width * 0.16,
        child: TextFormField(
          initialValue: zero.toString(),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 10,
                top: 0,
                bottom: 0,
                right: 10,
              ),
              fillColor: whitecolor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greycolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greycolor),
              )),
        ));
  }
}
