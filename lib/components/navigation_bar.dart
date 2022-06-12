import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  String action = 'home'; // 'home', '配對', '個人資訊'

  Widget _getButton(Widget beforeIcon, Widget afterIcon, String action){
    Color color = this.action == action ? Colors.pink : Colors.black26;
    Widget icon = this.action == action ? beforeIcon : afterIcon;
    Text text = Text(action, style: TextStyle(color: color));
    TextButton button = TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Colors.blue.withOpacity(0.04);
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed))
              return Colors.blue.withOpacity(0.12);
            return null; // Defer to the widget's default.
          },
        ),
      ),
      child: Text(action),
      onPressed:() => setState(()=> this.action = action),
    );
    return Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 30, right: 30),
        child: Row(
            children: this.action == action ? [button, text]: [button]
          )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        constraints: BoxConstraints(minWidth: 500, maxWidth: 1240),
        child: Row(
          children: [
            Spacer(),
            _getButton(Icon(Icons.star), Icon(Icons.star_outline), '配對'),
            _getButton(Icon(Icons.favorite), Icon(Icons.favorite_outline), '收藏'),
            _getButton(Icon(Icons.color_lens), Icon(Icons.color_lens_outlined), '主題館'),
            _getButton(Icon(Icons.child_friendly), Icon(Icons.child_friendly_outlined), '送養'),
            _getButton(Icon(Icons.local_hospital), Icon(Icons.local_hospital_outlined), '急診'),
          ],
        ),
      ),
    );
  }
}