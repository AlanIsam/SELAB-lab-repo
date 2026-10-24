import 'package:flutter/material.dart';

void main() {
  runApp(const BistroMenuApp());
}

class FoodItem {
  final String name;
  final String category;
  final String price;
  final String description;
  final IconData icon;
  final Color cardColor;

  const FoodItem({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.icon,
    required this.cardColor,
  });
}

class BistroMenuApp extends StatelessWidget {
  const BistroMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  final List<FoodItem> menuItems = const [
    FoodItem(
      name: 'Artisan Burger',
      category: 'Main Course',
      price: '\$15.99',
      description: 'Flamed-grilled beef patty served with melted cheddar cheese, crisp lettuce and special bistro sauce.',
      icon: Icons.lunch_dining,
      cardColor: Color(0xFF0F766E),
    ),
    FoodItem(
      name: 'Speciality Pasta',
      category: 'Italian',
      price: '\$13.50',
      description: 'Fettuccine toasted in a creamy garlic parmesan sauce topped with fresh herbs.',
      icon: Icons.ramen_dining,
      cardColor: Color(0xFF0284C7),
    ),
    FoodItem(
      name: 'Fresh Berry Smoothie',
      category: 'Beverage',
      price: '\$6.99',
      description: 'Blended strawberries, blueberries, greek yogurt and honey.',
      icon: Icons.local_cafe,
      cardColor: Color(0xFF7C3AED),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: const Color(0xFF0F172A),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final food = menuItems[index];
            return Card(
              elevation: 4,
              color: food.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(food: food),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          food.icon,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              food.price,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final FoodItem food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          food.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0F172A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: food.cardColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                food.icon,
                size: 90,
                color: food.cardColor,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  food.price,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: food.cardColor,
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                food.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
