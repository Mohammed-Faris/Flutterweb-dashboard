import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';

import '../constants/app_constants.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatefulWidget {
  bool isToggled;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  CustomSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.activeColor,
      required this.inactiveColor,
      required this.activeText,
      required this.inactiveText,
      required this.activeTextColor,
      required this.inactiveTextColor,
      required this.isToggled})
      : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        value: widget.value ? one : zero,
        vsync: this,
        duration: Duration(milliseconds: sixty.toInt()));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
              onTap: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }

                context
                    .read<WatchlistBloc>()
                    .add(WatchListToggled(!widget.isToggled));

                widget.value == false
                    ? widget.onChanged(true)
                    : widget.onChanged(false);
              },
              child: Container(
                  width: 93,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(twentyfive),
                      color: _circleAnimation.value == Alignment.centerLeft
                          ? widget.inactiveColor
                          : widget.activeColor),
                  child: Padding(
                      padding: const EdgeInsets.all(four),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _circleAnimation.value == Alignment.centerRight
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: fourteen, right: four),
                                    child: Text(
                                      widget.activeText,
                                      style: TextStyle(
                                          color: widget.activeTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )
                                : const SizedBox(),
                            Align(
                                alignment: _circleAnimation.value,
                                child: Container(
                                    width: fourtytwo,
                                    height: fourtytwo,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: secondarycolor))),
                            _circleAnimation.value == Alignment.centerLeft
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: four, right: eighteen),
                                    child: Text(widget.inactiveText,
                                        style: TextStyle(
                                            color: widget.inactiveTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)))
                                : const SizedBox()
                          ]))));
        });
  }
}
