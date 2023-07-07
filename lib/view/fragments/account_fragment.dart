import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/model/user.dart';

import '../partials/tag_item.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment(this.changeIndexCallback, {super.key});

  final Function(int) changeIndexCallback;

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  User user = AccountManager().user;

  Future<void> _logout() async {
    await AccountManager().logout();
    Navigator.of(context).pushNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(999),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: user.avatar,
                ),
              ),
            ),
            SizedBox(height: 10), // Spazio tra l'immagine e la riga di testo
            Text(
              '${user.name} ${user.surname}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/instagram.png',
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 8), // Spazio tra l'icona e il testo
                Text(
                  '${user.instagramNickname}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      _logout();
                    },
                    child: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  Text(
                    '${user.posts.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${user.following.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${user.comments.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Posts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Following',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Commenti',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Replace with your desired color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I miei tags:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Palette.red,
                    ),
                  ),

                  Container(
                    height: 200,
                    // Altezza desiderata per il GridView.builder
                    child: GridView.builder(
                      itemCount: user.tags.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        // child: TagItem(
                        //   //key: Key('tag_item_$index'),
                        //   icon: user.tags[index].icon,
                        //   text: user.tags[index].title,
                        // ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.65,
                    color: Colors.grey, // Replace with your desired color
                  ),
                  Text(
                    'I miei post:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Palette.red,
                    ),
                  ),
                  Text(
                    'ancora_nessun_post',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.4), // Replace with your desired color
                    ),
                  ),
                  //Container(
                    //height: 200, // Replace with your desired height
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: posts.length, // Replace with your data
                    //   itemBuilder: (context, index) {
                    //     return // Add your ListTile or widget for each post
                    //   },
                    // ),
                  //),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
