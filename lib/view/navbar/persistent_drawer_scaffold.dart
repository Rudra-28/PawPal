import 'package:flutter/material.dart';
import 'package:pawpalforpets/view/drawer/about_us.dart';
import 'package:pawpalforpets/view/drawer/donation.dart';
import 'package:pawpalforpets/view/drawer/logout.dart';
import 'package:pawpalforpets/view/drawer/my_pet_listing.dart';
import 'package:pawpalforpets/view/navbar/chat_view.dart';
import 'package:pawpalforpets/view/navbar/home_view.dart';
import 'package:pawpalforpets/view/navbar/my_fav.dart';
import 'package:pawpalforpets/view/navbar/profile_view.dart';
import 'package:pawpalforpets/view/navbar/upload_animal.dart';

class PersistentDrawerScaffold extends StatefulWidget {
  const PersistentDrawerScaffold({super.key});

  @override
  State<PersistentDrawerScaffold> createState() =>
      _PersistentDrawerScaffoldState();
}

class _PersistentDrawerScaffoldState extends State<PersistentDrawerScaffold> {
  int _selectedIndex = 0; // Track the current index

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const ChatScreen(),
    const UploadAnimalView(),
    const MyFav(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PawPal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              },
            ),
            ListTile(
              title: const Text('Donation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonationView()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogoutView()),
                );
              },
            ),
            ListTile(
              title: const Text('My Pet Listing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PetListingView()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyPetListing {
  const MyPetListing();
}

class DonateAnimal {
  const DonateAnimal();
}