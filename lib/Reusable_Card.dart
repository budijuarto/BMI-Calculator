import 'package:bmi_flutter/constant.dart';
import 'package:flutter/material.dart';

class sexCard extends StatelessWidget {
  sexCard({this.icons, this.sex});

  final IconData icons;
  final String sex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          sex,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

class IconContainer extends StatelessWidget {
  IconContainer({this.colours, this.cardChild, this.onPress});

  final Color colours;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colours, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}


class BottomButton extends StatelessWidget {

  BottomButton({this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButton,)),
        color: bottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: 80,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white,),
      onPressed:
      onPressed
      ,
      elevation: 10,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

