import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset('assets/instagram.svg',
              color: primaryColor, 
              height: 32,),
              actions: [
                IconButton(onPressed: () {},
                icon: const Icon(Icons.messenger_outline),
                )
              ],
              ),
              body:const PostCard(),
            
    );
  }
}