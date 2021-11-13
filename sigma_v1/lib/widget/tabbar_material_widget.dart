import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: MaterialColor(0x243242, sigma_night).withOpacity(0.5),
          ),
          BoxShadow(
            color: MaterialColor(0xFF817DEA, sigma_purple),
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF817DEA),
        notchMargin: -8,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildTabItem(
                  index: 3,
                  icon: Icon(Icons.star_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildTabItem(
                  index: 2,
                  icon: Icon(Icons.adjust_sharp),
                ),
              ),
              placeholder,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildTabItem(
                  index: 1,
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildTabItem(
                  index: 0,
                  icon: Icon(Icons.account_circle_sharp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.white : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
