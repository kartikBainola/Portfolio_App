import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/portfolio card.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subject': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/image1.png',
    },
    // Add more projects here
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subject': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/image2.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subject': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/image3.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subject': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/image4.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subject': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/image5.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SvgPicture.asset('assets/SVG/ic_round-shopping-bag.svg',
              width: 24.r, height: 24.r),
          16.verticalSpace,
          SvgPicture.asset('assets/SVG/ic_baseline-notifications.svg',
              width: 24.r, height: 24.r),
          16.verticalSpace,
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.orange,
            labelPadding: EdgeInsets.all(5).r,
            indicatorPadding: EdgeInsets.zero,
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.r),
            tabs: [
              Tab(text: 'Project'),
              Tab(text: 'Saved'),
              Tab(text: 'Shared'),
              Tab(text: 'Achievement'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).r,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search a project',
                hintStyle: TextStyle(
                    color: Color(
                      0xff9E95A2,
                    ),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: SvgPicture.asset(
                    'assets/SVG/search_icon.svg',
                    width: 28.r,
                    height: 28.r,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE0E0E0), width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(child: _buildProjectList()),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Filter'),
        icon: Icon(Icons.filter_list),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange.shade900,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.r)),
      ),
    );
  }

  Widget _buildProjectList() {
    final filteredProjects = _projects
        .where((project) =>
            project['title'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        final project = filteredProjects[index];
        return ProjectCard(project: project);
      },
    );
  }
}
