import 'package:flutter/material.dart';

class fashionpage extends StatefulWidget {
  const fashionpage({super.key});

  @override
  State<fashionpage> createState() => _fashionpageState();
}

class _fashionpageState extends State<fashionpage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search, color: Colors.grey), // Search icon
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  if (_searchFocusNode.hasFocus)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        _searchFocusNode.unfocus();
                        setState(() {
                          _searchQuery = '';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.clear, color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ),
            if (_searchFocusNode.hasFocus)
              SizedBox(height: 20),
            if (_searchFocusNode.hasFocus)
              Text('Search Query: $_searchQuery'),
          SizedBox(height: 20,),
            //CHOICES CATEGORY
            Text('Choose Clothing Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
            SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryContainer('Men\'s Clothing', Colors.blue),
                  SizedBox(width: 8),
                  _buildCategoryContainer('Women\'s Clothing', Colors.pink),
                  SizedBox(width: 8),
                  _buildCategoryContainer('Kid\'s Clothing', Colors.orange),
                ],
              ),
            ),
            SizedBox(height: 20,),
            //Featured Products/Top Rated
            Text("Top Rated Products",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Featured Products"),
                    ))
            ),
            SizedBox(height: 20,),
            //Top Stores Near You
            Text("Top Stores Near You",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            Expanded(
              child: ListView(
                children: [
                  _buildStoreContainer('Store 1', '123 Street, City', Icons.store),
                  SizedBox(height: 8),
                  _buildStoreContainer('Store 2', '456 Street, City', Icons.store),
                  SizedBox(height: 8),
                  _buildStoreContainer('Store 3', '789 Street, City', Icons.store),
                  // Add more stores as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget _buildCategoryContainer(String category, Color color) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget _buildStoreContainer(String storeName, String storeAddress, IconData storeIcon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(storeIcon, size: 50, color: Colors.blue), // Placeholder for store image
          SizedBox(height: 8),
          Text(storeName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(storeAddress),
        ],
      ),
    );
  }
}
