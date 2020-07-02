import 'package:flutter/material.dart';

class AnimatedSendButton extends StatefulWidget {
  final VoidCallback callback;
  final bool expanded;
  AnimatedSendButton({Key key, @required this.callback, this.expanded = false})
      : super(key: key);

  @override
  _AnimatedSendButtonState createState() => _AnimatedSendButtonState();
}

class _AnimatedSendButtonState extends State<AnimatedSendButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  bool show;
  bool sent = false;
  Color _color = Colors.lightBlue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.green;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (!sent) widget.callback();
                _animationController.forward();
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                padding: EdgeInsets.only(
                    left: _containerPaddingLeft,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0),
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (!sent)
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: Icon(Icons.send),
                            curve: Curves.fastOutSlowIn,
                            transform: Matrix4.translationValues(
                                _translateX, _translateY, 0)
                              ..rotateZ(_rotate)
                              ..scale(_scale),
                          )
                        : Container(),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 600),
                      child: show ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: show ? Text("Send") : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent ? Icon(Icons.done) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      alignment: Alignment.topLeft,
                      duration: Duration(milliseconds: 600),
                      child: sent ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent ? Text("Done") : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
