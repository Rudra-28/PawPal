import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pawpalforpets/services/location_services.dart';
import 'package:pawpalforpets/utilities/location_view.dart'; // Make sure to create this file
import 'package:pawpalforpets/view/Drawer/my_drawer.dart';
import 'package:pawpalforpets/view/bottom_category.dart';
import 'package:pawpalforpets/view/category_widget.dart';
import 'package:pawpalforpets/view/navbar/chat_view.dart';
import 'package:pawpalforpets/view/navbar/upload_animal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final LocationService _locationService = LocationService();

  static final List<Widget> _widgetOptions = <Widget>[
    // Replace with actual content for each screen
    const Text('Home'),
    const Text('Upload'),
    const Text('Favourites'),
    const Text('Profile'),
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
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to the location view and pass the location stream
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationView(
                    locationStream: _locationService.locationStream,
                  ),
                ),
              );
            },
            child: StreamBuilder<LocationData>(
              stream: _locationService.locationStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final location = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 4),
                        Text(
                          'Lat: ${location.latitude!.toStringAsFixed(2)}, Long: ${location.longitude!.toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
        bottom: _selectedIndex == 0
            ? PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for pets...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (text) {
                      // Perform search logic here
                      print('Search text: $text');
                    },
                  ),
                ),
              )
            : null,
      ),
      drawer: const MyDrawer(),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const CategoryScrollView(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Urgent Adoptions Required",
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const BottomCategoryScroll(),
                ],
              ),
            )
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UploadPet()));
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}