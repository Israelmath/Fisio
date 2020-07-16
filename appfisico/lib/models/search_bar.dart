import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 3,
            color: Colors.purple[600].withOpacity(0.20),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onSubmitted: (text) {
                print('$text');
              },
              decoration: InputDecoration(
                hintText: 'Buscar cliente',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.purple[600],
          ),
        ],
      ),
    );
  }
}
