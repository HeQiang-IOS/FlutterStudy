import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  const TurnBox({
    Key key,
    this.turns = .0,
    this.speed = 200,
    this.child,
  }):super(key:key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() {
    // TODO: implement createState
    return new _TurnBoxState();
  }

}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  void initState(){
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void didUpdateWidget(TurnBox oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns != widget.turns){
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

}