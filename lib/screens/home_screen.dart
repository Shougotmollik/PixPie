import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixpie/services/app_url.dart';
import 'package:pixpie/widgets/image_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.afterScrollResult});
  final Function(bool) afterScrollResult;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _isVisible = true;

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_isVisible) {
            _isVisible = false;
            widget.afterScrollResult(_isVisible);
          }
        }

        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isVisible) {
            _isVisible = true;
            widget.afterScrollResult(_isVisible);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    title: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                    ),
                    bottom: const TabBar(
                      tabs: [
                        Tab(text: "Suggested"),
                        Tab(text: "Liked"),
                        Tab(text: "Library"),
                      ],
                      indicatorColor: Colors.redAccent,
                      indicatorWeight: 4,
                    ),
                    centerTitle: true,
                  )
                ];
              },
              body: TabBarView(
                children: [
                  // Suggested tab
                  MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    itemBuilder: (context, index) {
                      return ImageTile(
                        index: index,
                        extent: (index % 2) == 0 ? 300 : 150,
                        imageSource: AppUrl.getImageUrl(index),
                      );
                    },
                  ),

                  //   Liked tab
                  const SizedBox(),

                  //   Library tab
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
