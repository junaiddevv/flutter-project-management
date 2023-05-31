

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import 'package:percent_indicator/percent_indicator.dart';
import '../../../components/stacked_images.dart';
import '../../../config/appstrings.dart';

import '../../../config/assets.dart';
import '../../../config/colors.dart';
import '../../../config/size_config.dart';
import '../../../config/styles.dart';

import 'list_cards.dart';
// import 'list_cards.dart';
// import 'all_cards.dart';
class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
   
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.addTask,
                style: headingStyleLargeTwo,
              ),
              Text(
                AppStrings.allTask,
                style: headingStyleSmall,
              )
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(12)),
          SizedBox(
            height: 230,
            child: _buildTasks()),
           const  Text(
                AppStrings.category,
                style: headingStyleLargeTwo,
              ),
            _buildCatwgory() 
        ]),
      ),
    );
  }
 Widget _buildTasks() {
    return ListView.builder(
     
       scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: taskData.length,
      
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: kColorWhite),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: AllCardList(
                
                projectTitle: taskData[index]['title'],
                 subTitle: taskData[index]['subtitle'],
               
              
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCatwgory() {
    return  Container(
      height: 70,
       decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: kColorWhite),
child: Padding(
  padding: const EdgeInsets.all(18.0),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
      
        children: [
      
      Image.asset('assets/images/download.png',),
      
        const  Padding(
            padding:  EdgeInsets.only(left: 8),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Text(
            
                 AppStrings.planning,style: TextStyle(color: Colors.black,
                 fontWeight: FontWeight.bold),
            
                ),
                 Text(
      
                 AppStrings.file,style: TextStyle(color: Colors.grey,
                 ),
            
                ),
            
              ],
            
            ),
          ),
           ],
      
      ),
       IconButton(
        
        onPressed: 
       
       (){
        
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor:const Color(0xFFA49393),
  builder: (context) => Container(
    height: MediaQuery.of(context).size.height * 0.75,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft:  Radius.circular(25.0),
        topRight:  Radius.circular(25.0),
      ),
    ),
    child:Padding(
      padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
      child: Column(
        children: [
          Container(
            height: 170,
             decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0), color: const Color(0xFFE4E0E0)),
                      child: Padding(
                        padding:const  EdgeInsets.all(8.0),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              const  Column(

                                  children: [
                                    Text(
                                      AppStrings.mobile,style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      AppStrings.maximum,style: TextStyle(color: Colors.grey,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                 CircularPercentIndicator(
                    radius: 38.0,
                    lineWidth: 5.0,
                    percent: 0.8,
                    animation: true,
                    animationDuration: 1200,
                    center: const Text("80%",style: TextStyle(color: Colors.black),),
                    progressColor: Colors.blue[900],
                  ),
                              
                              ],
                            ),
                         const   SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF6767E9),
           
           
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
                                 child:const Text('App',style: TextStyle(color: Colors.white),)),
                                  ElevatedButton(onPressed: (){}, 
                                   style: ElevatedButton.styleFrom(
          foregroundColor:const Color(0xFFE96776),
           
           
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
                                  child:const  Text('Done',style: TextStyle(color: Colors.white),))
                              ],
                            )
                          ],
                        ),
                      ),
          ),
       const   SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const   Text(
                AppStrings.team,style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
              ),
              Row(
                
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        buildStackedImages(),
                      const  Padding(
                          padding:  EdgeInsets.only(left: 8),
                          child: Text(
                            AppStrings.date,style: TextStyle(color: Colors.grey,fontSize: 13),
                          ),
                        ),
                    const    Padding(
                          padding:  EdgeInsets.only(left: 18),
                          child: Text(
                              AppStrings.time,style: TextStyle(color: Colors.grey,fontSize: 13),
                            ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
         const     Text('rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker inclu',style: TextStyle(color: Colors.grey,fontSize: 13)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                onPressed: () {},
                child:const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Comments'), // <-- Text
                    SizedBox(
                      width: 5,
                    ),
                    Icon( // <-- Icon
                      Icons.comment,
                      size: 24.0,
                    ),
                  ],
                ),
              ),

                ElevatedButton(
                onPressed: () {},
                child:const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Attach'), // <-- Text
                    SizedBox(
                      width: 5,
                    ),
                    Icon( // <-- Icon
                      Icons.attachment,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    )
  ),

);  },
       icon:const Icon(Icons.more_vert,
       color: Colors.grey,))
      
       
    ],
  ),
),
    );
  }

   Widget buildStackedImages({
    TextDirection direction = TextDirection.rtl,
  }) {
    const double size = 48;
    const double xShift = 12;
    final urlImages = [
      AppAssets.imagUrl1,
      AppAssets.imagUrl2,
      AppAssets.imagUrl3,
      AppAssets.imagUrl4,
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    const double borderSize = 2;

    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: urlImage,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

    
