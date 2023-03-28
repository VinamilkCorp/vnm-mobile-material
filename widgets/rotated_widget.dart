import 'package:flutter/material.dart';

class RotatedSection extends StatefulWidget {
  final Animatable<double> animatable;
  final Widget child;
  final bool expand;
  RotatedSection(
      {this.expand = false, required this.animatable, required this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<RotatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _runExpandCheck() {
    if (widget.expand) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(RotatedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: widget.animatable.animate(_controller),
      child: widget.child,
    );
  }
}
