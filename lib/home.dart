import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  String url = "https://api.edamam.com/search?q=chicken&app_id=58567d9e&app_key=2b4b0911f9e74cf2e9e25bb258898f64";

  void getRecipe(String query) async
  {
    String url = "https://api.edamam.com/search?q=$query&app_id=58567d9e&app_key=2b4b0911f9e74cf2e9e25bb258898f64";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    log(data.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipe("Ladoo");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff213A50),
                  Color(0xff071938),
                ],
              ),
            ),
          ),
          Column(
            children: [
              //Start Search Bar
              SafeArea(
                child: Container(
                // Search Container
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") == "") {
                            print("Blank Search");
                          } else {
                            getRecipe(searchController.text);
                          }

                  // Define your onTap action here
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ), // Use Icon widget here
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Let's Cook Something",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Search Bar End end
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WHAT DO YOU WANT TO COOK TODAY ?", style: TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Let's Cook Something New", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

            ],
          ),
          // Search Bar Col end
        ],
      ),
    );
  }
}
