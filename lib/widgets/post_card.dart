import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final snap;

  const PostCard({Key? key,required this.snap}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: mobileBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            //Header Section
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ).copyWith(
                right: 0,
              ),
              child: Row(children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                     snap['profImage']
                     ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snap['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                  child: ListView(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shrinkWrap: true,
                                children: ['Delete']
                                    .map((e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList(),
                              ),),);
                    },
                    icon: const Icon(Icons.more_vert),),
              ]),

             
            ),
             //Image Section
              SizedBox(
                height:MediaQuery.of(context).size.height*0.35,
                child: Image.network(snap['photoUrl'],
                fit: BoxFit.cover,
                ),
                
                ),
                //Likes and comment section
                 Row(children: [
                  IconButton(onPressed: () {}, 
                  icon: const Icon(
                    Icons.favorite,
                    color:Colors.red,
                  ),
                  ),

                  IconButton(onPressed: () {}, 
                  icon: const Icon(
                    Icons.comment_outlined,
                  ),
                  ),
                  IconButton(onPressed: () {}, 
                  icon: const Icon(
                    Icons.send,
                  ),
                  ),
                  Expanded(child: Align(
                    alignment:Alignment.bottomRight,
                    child:IconButton(
                      icon:const Icon(Icons.bookmark_border),
                      onPressed: (){},
                    )
                  ),)
                 ],),
                 //description and number of comment
                 Container(
                  padding:const EdgeInsets.symmetric(horizontal:16,),
                  child:Column(
                    mainAxisSize:MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight:FontWeight.w800),
                        child: Text("${snap['likes'].length} likes", style:Theme.of(context).textTheme.bodyText2,),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top:8,
                          ),
                          child:RichText(
                            text: TextSpan(
                            style: const TextStyle(color:primaryColor),
                            children: [
                              TextSpan(
                                text: '${snap['username']}',
                                style:const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' ${snap['description']}',
                                style:const TextStyle(fontWeight: FontWeight.bold),
                              )
                            ]
                          ),),
                        ),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            padding:const EdgeInsets.symmetric(vertical:4),
                            child:Text("View all 200 comment",
                            style: TextStyle(fontSize:16,color:secondaryColor),
                            ),),
                        ),
                        Container(
                            padding:const EdgeInsets.symmetric(vertical:4),
                            child:Text(
                              DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                            style: TextStyle(fontSize:16,color:secondaryColor),
                            ),),
                  ],)
                 )

          ],
        ));
  }
}
