import 'package:flutter/material.dart';
class AllCardList extends StatelessWidget {
 
  final String projectTitle,subTitle;
 
 

  const AllCardList({
    super.key,
   
    required this.projectTitle,
     required this.subTitle,
  
    
   
  });
   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 190,
          // margin: EdgeInsets.only(bottom: 190),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.blue[50],),
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),
                ),
              ),
              Text(
                 projectTitle,style:const TextStyle(color: Colors.black),
              ),
           const   SizedBox(
                height: 5,
              ),
               Text(
                 subTitle,style: const TextStyle(color: Colors.grey,),
              ),

            ],
            
          ),
        ),
      ],
    );
  }
}