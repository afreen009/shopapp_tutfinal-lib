import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports
import 'package:shopapp_tut/components/horizontal_listview.dart';
import 'package:shopapp_tut/components/products.dart';
import 'package:shopapp_tut/pages/cart.dart';


void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  @override   
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   Widget image_carousel = new Container(
     height: 150.0,
     child: new Carousel(
       boxFit: BoxFit.cover,
       images: [
         AssetImage('images/m1.jpeg'),
         AssetImage('images/m2.jpg'),
         AssetImage('images/c1.jpg'),
         AssetImage('images/w1.jpeg'),
         AssetImage('images/w4.jpeg'),
         AssetImage('images/w3.jpeg'),
       ],
       autoplay: false,
//       animationCurve: Curves.fastOutSlowIn,
//       animationDuration: Duration(milliseconds: 1000),
       dotSize: 4.0,
       //dotColor: Colors.red,
       indicatorBgPadding: 4.0,
     ),
   );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: Text('fasi-on'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));})
          ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
             new UserAccountsDrawerHeader(
                 accountName: Text('shifa afreen'),
                 accountEmail: Text('shfafreen@gmail.com'),
             currentAccountPicture: GestureDetector(
               child: new CircleAvatar(
                 backgroundColor: Colors.grey,
                 child: Icon(Icons.person, color: Colors.white,),
               ),
             ),
                 decoration: new BoxDecoration(
                   color: Colors.red
                 ),
             ),

//            body

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.pink,),
            ),
          ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.pink,),
              ),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.pink,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard, color: Colors.pink,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite, color: Colors.pink,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.pink,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: new Text('Categories')),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,        
              child: new Text('Recent products')),),

          //grid view
         
            Flexible(child: Products(),)
          
        ],
      ),
    );
  }
}
