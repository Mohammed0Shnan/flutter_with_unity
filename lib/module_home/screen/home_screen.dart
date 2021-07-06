import 'package:flutter/material.dart';
import 'package:tut/module_antomy/screen/veiw_screen.dart';
import 'package:tut/module_settings/setting_routes.dart';
import 'package:tut/utils/back_ground/background.dart';
import 'package:tut/utils/size_configration/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingRoutes.ROUTE_SETTINGS);
                },
                padding: EdgeInsets.only(right: 40, top: 20),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMulti * 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'kfht fhuut is niommfnr informatio isd ndewin kfht fhuut is niommfnr informatio isd ndewin kfht fhuut is niommfnr informatio isd ndewin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 19,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(text: 'View' ,onClick:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewScreen()));
                  } ),
                  _buildButton(text: 'Anatomy')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(text: 'Educational'),
                  _buildButton(text: 'Curative')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _buildButton(text: 'Exit'),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _buildButton({Function onClick, String text}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          height: 50,
          width: 140,
          decoration: BoxDecoration(
              color: Colors.brown.shade400,
              gradient: LinearGradient(
                colors: [Colors.brown.shade400, Colors.brown.shade200],
              ),
              borderRadius: BorderRadius.circular(30)),
          child: Text(text,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }
}
