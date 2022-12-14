
import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.2){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'Your body weight is more than normal weight .Try to exercise!!!';
    }else if(_bmi > 18.2){
      return 'Your body weight is normal .WELL DONE!!!';
    }else{
      return 'Your body weight is very low .Eat more food!!!';
    }
  }
}