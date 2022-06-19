// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/example/projects.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/widgets/Cards/intro_card.dart';
import 'package:my_portfolio/widgets/Cards/project_card.dart';
import 'package:my_portfolio/widgets/Header/header.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Share.share(
            "Check out Muzammil's Portfolio https://portfolioapp1-56014.web.app/#/"
          );
        }, child: Icon(Icons.share, color: Colors.white,),
      ),
      body: SafeArea(
        // bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Projects",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Responsive(
                    mobile: mobileTabletBuilder(350),
                    tablet: mobileTabletBuilder(450),
                    desktop: desktopBuilder(),
                  ),
                                // SizedBox(
                  //   height: 350,
                  //   child: ListView.builder(  
                  //     controller: _scrollController,
                  //     scrollDirection: Axis.horizontal,    
                  //     itemCount: projects.length,
                  //     itemBuilder: (context, index){
                  //       return ProjectCard(project: projects[index]);
                  //     }
                  //   )
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }

  Widget desktopBuilder() {
    
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        
      ),

      itemCount: projects.length,
      itemBuilder: (BuildContext context, int index) { 
        return ProjectCard(project: projects[index]);
      },

    );

  }





}

