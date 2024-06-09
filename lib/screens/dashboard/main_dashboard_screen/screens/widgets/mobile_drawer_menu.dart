import 'package:flutter/material.dart';

Widget mobileDrawerMenu() {

  print("======================================= drawer");

  return Drawer(
    elevation: 16.0,

    child: Container(
      color: Colors.deepPurple,
      height: 200,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: () {},
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                tooltip: "Add Photo",
                splashColor: Colors.black,
                icon: const Icon(
                  Icons.add_a_photo_rounded,
                ),
              ),
            ),
            accountName: const Text("My Name"),
            accountEmail: const Text(
              "myemail@gmail.com",
            ),
          ),
          ListTile(
            //tileColor: Colors.green,
            onTap: () {},
            leading: const Icon(Icons.person),
            hoverColor: Colors.grey,
            title: const Text("My Account"),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart_outlined),
            hoverColor: Colors.grey,
            title: const Text("Cart"),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.storefront_sharp),
            hoverColor: Colors.grey,
            title: const Text("Shop"),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.location_on_outlined),
            hoverColor: Colors.grey,
            title: const Text("Map"),
          ),
          const Divider(
            thickness: 2.0,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            hoverColor: Colors.grey,
            title: const Text("Settings"),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout),
            hoverColor: Colors.grey,
            title: const Text("Logout"),
          ),
        ],
      ),
    ),
  );
}
