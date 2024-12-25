import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixpie/services/app_url.dart';
import 'package:pixpie/widgets/image_tile.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  int _currentSliderIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          //   Image Slider
          SliverAppBar(
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    itemCount: 5,
                    onPageChanged: (value) {
                      setState(() {
                        _currentSliderIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: AppUrl.getSliderImageUrl(index),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          5,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 08,
                              height: 08,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == _currentSliderIndex
                                    ? Colors.white
                                    : Colors.white54,
                              ),
                            );
                          },
                        ),
                      ))
                ],  
              ),
            ),
          ),

          //   Search bar
          SliverAppBar(
            floating: true,
            snap: true,
            title: TextFormField()
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
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
      ),
    ));
  }
}
