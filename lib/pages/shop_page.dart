import 'package:flutter/material.dart';

class shoppage extends StatefulWidget {
  const shoppage({super.key});

  @override
  State<shoppage> createState() => _shoppageState();
}

class _shoppageState extends State<shoppage> {
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
      body: Padding(
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
            SizedBox(height: 20),
            //FEATURED PRODUCTS
            Text("Top Rated Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Featured Products"),
                    ))
                ),
            SizedBox(height: 20,),
            //FEATURED STORES/STORES WITH MOST DISCOUNT
            Text("Top Rated Stores",
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
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Stores with most discount"),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("This Week's Champions",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            //THIS WEEK CHAMPIONS
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person, color: Colors.white), // Placeholder for user picture
                      ),
                      Text(
                        "Lucky Winner", // User name
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Prize: Rs1000 Gift Card", // Prize won
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
