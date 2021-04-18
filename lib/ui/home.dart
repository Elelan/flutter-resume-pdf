import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:flutter_resume_pdf/ui/components/social.dart';
import 'package:flutter_resume_pdf/ui/components/web_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/about.dart';
import 'components/experience.dart';
import 'components/side_menu.dart';
import 'responsive_widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MenuController _controller = Get.put(MenuController());

  @override
  void initState() {
    super.initState();
    _controller.scrollController.addListener(() {
      _controller.fabStream.sink.add(_controller.scrollController.offset > 500);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.fabStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldKey,
      drawer: SideMenu(),
      body: Scrollbar(
        child: CustomScrollView(
          controller: _controller.scrollController,
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: MySliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * .4)),
            // SliverToBoxAdapter(
            //   key: _controller.headerGlobalKey,
            //   child: Container(
            //     //padding: EdgeInsets.all(kDefaultPadding),
            //     constraints: BoxConstraints(maxWidth: kMaxWidth),
            //     child: SafeArea(child: Header()),
            //   ),
            // ),
            ..._slivers()
          ],
        ),
      ),
      floatingActionButton: _buildFab(),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _controller.aboutGlobalKey,
          child: About(),
        ),
        SliverToBoxAdapter(
          key: _controller.experienceGlobalKey,
          child: Experience(),
        )
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _controller.fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab
                ? _controller.scrollToHeader
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: Icon(Icons.arrow_upward, size: 20),
          ),
        );
      },
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final String _name = "Elelan";
  final String _job = "Mobile Developer";
  final String _description =
      'A mobile full stack developer with experience building mobile and web applications';
  final double expandedHeight;

  final MenuController _controller = Get.put(MenuController());

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        //clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: double.infinity,
            color: kDarkBlackColor,
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (Responsive.isMobile(context))
                    IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _controller.openOrCloseDrawer();
                        }),
                  if (!Responsive.isMobile(context))
                    Container(
                        padding: EdgeInsets.only(
                            top: kDefaultPadding, left: kDefaultPadding),
                        foregroundDecoration: BoxDecoration(
                          color: Colors.grey,
                          backgroundBlendMode: BlendMode.saturation,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/mobile_dev.svg',
                          width: 80,
                          height: 80,
                        )),
                  Spacer(),
                  if (!Responsive.isMobile(context)) WebMenu(),
                  Spacer(),
                  Social()
                ],
              ))),
          Positioned(
              top: kToolbarHeight,
              child: SafeArea(
                child: Opacity(
                  opacity: (1 - (shrinkOffset / maxExtent)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: kDefaultPadding * 2),
                        Text(
                          "I am $_name",
                          style: TextStyle(
                            fontSize: 40,
                            color: kBgColor,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$_job',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'Raleway',
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5,
                              vertical: kDefaultPadding /
                                  (Responsive.isDesktop(context) ? 1 : 2),
                            ),
                          ),
                          child: Text('Download Resume'),
                        ),
                        if (Responsive.isDesktop(context))
                          SizedBox(height: kDefaultPadding),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight * 1.2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
