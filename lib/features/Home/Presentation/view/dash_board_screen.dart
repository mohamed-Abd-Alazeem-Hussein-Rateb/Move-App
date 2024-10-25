import 'package:flutter/material.dart';
import 'package:moveapp/core/utils/constant.dart';
import 'package:moveapp/features/Home/Presentation/view/HomeScreen.dart';
import 'package:moveapp/features/Search/Presentation/view/SearchScreen.dart';
import 'package:moveapp/features/Witch_list.dart/presentation/views/Witsh_list.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    const Homescreen(),
    const SearchScreen(),
    const WitshListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimariyColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimariyColor,
        selectedItemColor: Colors.blue, // لون الأيقونة المختارة
        unselectedItemColor: Colors.grey, // لون الأيقونات الغير مختارة
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // لتثبيت الـ BottomNavigationBar
        items: [
          BottomNavigationBarItem(
            icon: _buildIconWithBlueLine(Icons.home_outlined, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithBlueLine(Icons.search_outlined, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithBlueLine(Icons.bookmark_outline, 2),
            label: 'Watch list',
          ),
        ],
        elevation: 8, // إضافة ظل أسفل البار لتحسين مظهره
      ),
    );
  }

  // هذه الدالة تبني الأيقونة مع الخط الأزرق الثابت فوق الأيقونة
  Widget _buildIconWithBlueLine(IconData iconData, int index) {
    return Column(
      children: [
        // الخط الأزرق الثابت أعلى الأيقونة بمسافة
        Container(
          height: 2, // سمك الخط الأزرق
          width: double.infinity, // عرض الخط الأزرق (يمكنك تخصيصه ليتناسب مع العرض المطلوب)
          color: Colors.blue, // لون الخط الأزرق
          margin: const EdgeInsets.only(bottom: 9), // مسافة بين الخط والأيقونة
        ),
        Icon(
          iconData,
          size: 25, // حجم الأيقونة
          color: _selectedIndex == index ? Colors.blue : Colors.grey,
        ),
      ],
    );
  }
}
