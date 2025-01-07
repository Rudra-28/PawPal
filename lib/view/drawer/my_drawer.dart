import 'package:flutter/material.dart';
import 'package:pawpalforpets/view/Drawer/my_pet_listing.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
             const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
         ListTile(
            leading: const Icon(Icons.list), // List icon
            title: const Text('My Pet Listings'),
            onTap: () {
              // Navigate to the pet listing screen
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyPetListingsScreen(), // Replace with your actual screen
                ),
              );
            },
          ),
       
         
          ListTile(
            leading: const Icon(Icons.volunteer_activism), // List icon
            title: const Text('Volunteer yourself'),
            onTap: () {
              // Navigate to the pet listing screen
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyPetListingsScreen(), // Replace with your actual screen
                ),
              );
            },
          ),
           const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
           const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}