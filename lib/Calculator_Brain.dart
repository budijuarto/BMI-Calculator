

import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.weight,this.height});

  final double height;
  final int weight;

  double _bmi;

  String calculteBMI(){
     _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    } else if (_bmi > 20){
      return 'Normal';
    } else{
      return 'UnderWeight';
    }
  }

  String getIntrepertation(){
    if(_bmi>=25){
      return 'Gemuk banget si loe diet lah';
    } else if (_bmi > 20){
      return 'Kamu punya bmi normal, keren!';
    } else{
      return 'Loe kurus makan- makan lagi aja biar nambah berat badan';
    }
  }



}