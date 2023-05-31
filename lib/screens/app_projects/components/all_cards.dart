
import 'package:flutter/material.dart';




import '../../../../config/colors.dart';
import 'list_cards.dart';

class AllCards extends StatefulWidget {
  const AllCards({super.key});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  final List<Map<String, dynamic>> taskData = [
    {
      'title': 'Web design',
      'subtitle': 'SVG & All file',
    },
    {
      'title': 'Mobile Design',
      'subtitle': 'SVG & All file',
    },
    {
      'title': 'App Design',
      'subtitle': 'SVG & All file',
    },
    {
      'title': 'App Project',
      'subtitle': 'SVG & All file',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: taskData.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: kColorWhite),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child:  AllCardList(
                
                projectTitle: taskData[index]['title'],
                 subTitle: taskData[index]['subtitle'],
               
                
               
               
              ),
            ),
          ),
        );
      },
    );
  }

//Stacked Images with + indicator
  

  
}
