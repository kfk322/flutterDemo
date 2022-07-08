import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: UserAccountsDrawerHeader(
                accountName: const Text("K"),
                accountEmail: const Text("W@W"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bg03.jpg"),
                        fit: BoxFit.cover)),
                otherAccountsPictures: [
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
                ],
              )
                  //     DrawerHeader(
                  //   decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       image: DecorationImage(
                  //           image: AssetImage("images/bg03.jpg"),
                  //           fit: BoxFit.cover)),
                  //   child: Text("Hello Flutter!!"),
                  // )
                  )
            ],
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text("User"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/user");
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.power_input)),
            title: const Text("Button"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/button");
            },
          ),
          const Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.date_range)),
            title: Text("Date Format"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/dateFormat");
            },
          ),
          const Divider(),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.swipe)),
            title: Text("Swiper"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/swiper");
            },
          ),
        ]),
      );
}
