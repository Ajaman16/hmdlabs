import 'package:meta/meta.dart';

class SwitchModel{
   String switchName;
   bool switchState;

   SwitchModel({@required this.switchName}):
       switchState = false;

   @override
   String toString() {
     return "$switchName : $switchState";
   }


}