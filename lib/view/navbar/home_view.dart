import 'package:flutter/material.dart';
import 'package:pawpalforpets/utilities/location_view.dart';
import 'package:pawpalforpets/view/bottom_category.dart';
import 'package:pawpalforpets/view/category_widget.dart';
import 'package:pawpalforpets/view/navbar/chat_view.dart'; 

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

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
         actions: [ 
          // Location panel
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Adjust padding as needed
            child: InkWell( // Or GestureDetector for tap functionality
              onTap: () {
                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LocationWidget()));
              },
              child: const Row(
                children: [
                  Icon(Icons.location_on, size:40, color: Colors.black), // Location icon
                  SizedBox(width: 4),
                  Text('Pune', style: TextStyle(color: Colors.black)), // Replace with actual location
                ],
              ),
            ),
          ),
        ],
        // Conditionally show the search bar
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
            : null, // Set to null to hide the search bar
      ),
      body: _selectedIndex == 0
          ? SingleChildScrollView( // Wrap the Column with SingleChildScrollView
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
                      color: const Color(0xFFE0F2F7), // Dark background color
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
            label: 'chatting',
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
         onTap: (int index) { // Handle taps here
    if (index == 1) { // Check if "Chats" is tapped (index 1)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    } else {
      // Handle taps on other icons if needed
      _onItemTapped(index); // This is your existing function to update _selectedIndex
    }
  }),
    );
  }
}