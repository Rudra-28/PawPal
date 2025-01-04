import 'package:flutter/material.dart';
import 'package:pawpalforpets/utilities/adopting_messages.dart';
import 'package:pawpalforpets/utilities/donating_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> 
    with SingleTickerProviderStateMixin { 
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Buying'),
            Tab(text: 'Selling'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AdoptingMessages(),
          DonatingMessages(),
        ],
      ),
    );
  }
}