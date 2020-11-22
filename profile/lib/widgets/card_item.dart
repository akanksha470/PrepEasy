import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "ABC XYZZ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12.0,
                        ),
                      ),
                      
                    ],
                    
                  ),
                  new Spacer(),
                  IconButton(
                    // alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 40.0,
                      color: Color(0xFF071A3F),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Email Id",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "abc@gmail.com",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12.0,
                        ),
                      ),
                      
                    ],
                    
                  ),
                  new Spacer(),
                  IconButton(
                    // alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 40.0,
                      color: Color(0xFF071A3F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
