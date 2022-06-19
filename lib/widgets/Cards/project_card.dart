import 'package:flutter/material.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/pages/project/project_detail.dart';
import 'package:my_portfolio/responsive.dart';


class ProjectCard extends StatelessWidget {

  final Project project;

  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
      Navigator.push(context, 
        MaterialPageRoute(builder: (_)=> ProjectDetail(project: project,))),

      child: Container(
        width: 300,
        // height: 350,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal:14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
               color: Colors.black.withOpacity(0.15),
               blurRadius: 15,
               offset: Offset(5,15)
            
              )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${project.name}", style: TextStyle(fontSize: 18)),
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
            SizedBox(height: 10,),
            Hero(
              tag: project.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Responsive(
                  mobile: Image.network(
                  "${project.imageUrl}",
                  fit: BoxFit.cover,
                  ),
                  tablet: Image.network(
                  "${project.imageUrl}",
                  fit: BoxFit.cover,
                 ),
                  
                  desktop:SizedBox(
                    height: 350,
                    child: Image.network(
                    "${project.imageUrl}",
                    fit: BoxFit.cover,
                ),
                  ) ,
                )
                
              ),
            ),
            SizedBox(height: 10,),
    
            Text("""${project.description}""",
              maxLines: 3,
              style: TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            
            ),
            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
