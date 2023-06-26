import 'package:flutter/material.dart';
import '../../core/utils/consts.dart';
import 'drawer_header.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.55),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          CustomDrawerHeader(),
          DrawerItem(icon: Icons.home, text: 'Home'),
          DrawerItem(icon: Icons.category_sharp, text: 'Category'),
          DrawerItem(icon: Icons.favorite, text: 'Favourite'),
          DrawerItem(
              icon: Icons.local_grocery_store_outlined, text: 'Purchased'),
          DrawerItem(icon: Icons.movie_filter_outlined, text: 'Video Option'),
          DrawerItem(icon: Icons.info, text: 'About Movo'),
        ],
      ),
    );
  }
}
