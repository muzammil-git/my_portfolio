import 'package:flutter/material.dart';
import 'package:my_portfolio/models/projects.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(onPressed: () => Navigator.pop(context)),
                  Text(
                    "${project.name}",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 08, vertical: 06),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      "${project.year}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),

              Hero(
                tag: project.name,
                child: SizedBox(
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      "${project.imageUrl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12,),

              Text(
                "Technologies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              
              ),

              SizedBox(height: 06,),

              HorizontalTechView(techList: project.technologiesUsed ?? []),

              SizedBox(height: 15,),

              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10,),

              Text(
                "${project.description}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
              ),


                  
            ]),
          ),
        ),
      ),
    ));
  }
}

class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  
  HorizontalTechView({required this.techList, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),

            child: Text("${techList[index]}"),
          );
        },
        
      ),
    

    );
  }
}