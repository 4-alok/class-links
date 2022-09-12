import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlidingSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const SlidingSwitch({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  SlidingSwitchState createState() => SlidingSwitchState();
}

class SlidingSwitchState extends State<SlidingSwitch>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController hController;
  late final Animation<double> animation;
  late final Animation<double> hAnimation;
  double value = 0.0;

  late bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    hController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    hController = AnimationController(
        value: 0, vsync: this, duration: const Duration(milliseconds: 200));
    hAnimation = Tween<double>(begin: 40, end: 60)
        .animate(CurvedAnimation(parent: hController, curve: Curves.easeInOut));
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 400));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController
        .addListener(() => setState(() => value = animation.value));
    turnState = false;
    _determine();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onPanStart: (_) => hController.forward(),
      onDoubleTap: () => _action,
      onTap: () => _action,
      onPanEnd: (details) {
        hController.reverse();
        _action;
      },
      child: AnimatedBuilder(
        animation: hAnimation,
        builder: (context, child) => Container(
          height: hAnimation.value,
          width: 250,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).primaryColor.withAlpha(100)
                  : Theme.of(context).primaryColor.withAlpha(20),
              borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.all(2),
          child: Stack(children: <Widget>[
            Transform.translate(
                offset: Offset(((250 * 0.5) * value - (2 * value)), 0),
                child: Container(
                  height: hAnimation.value,
                  width: 250 * 0.5 - 4,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      color: Theme.of(context).colorScheme.onPrimary,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.4),
                          offset: const Offset(0, 5),
                          blurRadius: 20.0,
                        ),
                      ]),
                )),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.table,
                      size: 15,
                      color: !turnState ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.book,
                      size: 15,
                      color: turnState ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ));

  get _action => _determine(changeState: true);

  _determine({bool changeState = false}) => setState(() {
        if (changeState) turnState = !turnState;
        (turnState)
            ? animationController.forward()
            : animationController.reverse();
        if (changeState) widget.onChanged(turnState);
      });
}
