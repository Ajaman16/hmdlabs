import 'package:flutter/material.dart';
import '../models/switch_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<SwitchModel> switches;
  bool allSwitchState = false;

  @override
  void initState() {
    super.initState();
    initSwitches();
  }

  void initSwitches() {
      switches = List();
      switches.add(SwitchModel(switchName: "DrawingRoom"));
      switches.add(SwitchModel(switchName: "BedRoom"));
      switches.add(SwitchModel(switchName: "StoreRoom"));
      switches.add(SwitchModel(switchName: "BathRoom"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Homad Labs"),
        actions: <Widget>[

          Switch(
            activeColor: Colors.lightGreen,
            value: allSwitchState,
            onChanged: (value){

              switches.forEach((sw){
                sw.switchState = value;
              });

              setState(() {
                allSwitchState = value;
              });
            }
          ),

        ],
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: ListView.builder(
        itemCount: switches.length,
        itemBuilder: (context, index){
          return buildList(context, index);
        }
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        ListTile(

          title: Text(
            "${switches[index].switchName}",
            style: TextStyle(
              fontSize: 22.0
            ),
          ),

          trailing: new Switch(
              value: switches[index].switchState,
              onChanged: (value){

                setState(() {
                  switches[index].switchState = value;

                  var checkList = switches.where((sw){
                    return sw.switchState == false;
                  }).toList();

                  allSwitchState = checkList.length == 0 ? true : false;

                });
                print(switches.toString());
              }
          ),

        ),
        Divider()
      ],
    );
  }


}
