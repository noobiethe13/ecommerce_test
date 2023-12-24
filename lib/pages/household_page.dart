import 'package:flutter/material.dart';

class householdpage extends StatefulWidget {
  const householdpage({super.key});

  @override
  State<householdpage> createState() => _householdpageState();
}

class _householdpageState extends State<householdpage> {
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
            //Featured Products/Top Rated
            Text("Top Rated Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Top Rated Products"),
                    ))
            ),
            SizedBox(height: 20,),
            //Categories
            Text("Shop By Category",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Categories"),
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
                ],
              ),
            ),
          ],
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
