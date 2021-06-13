import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:flutter_resume_pdf/ui/components/contact.dart';
import 'package:flutter_resume_pdf/ui/components/landing_view.dart';
import 'package:flutter_resume_pdf/ui/components/social.dart';
import 'package:flutter_resume_pdf/ui/components/timeline.dart';
import 'package:flutter_resume_pdf/ui/components/web_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/about.dart';
import 'components/app_bar.dart';
import 'components/experience.dart';
import 'components/projects.dart';
import 'components/side_menu.dart';
import 'components/web_menu.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.fabStream.close();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _controller.scaffoldKey,
      drawer: SideMenu(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            MyAppBar(),
            Expanded(
              child: NestedScrollView(
                controller: _controller.scrollController,
                headerSliverBuilder: (ctx, innerBoxScroll) {
                  return <Widget>[
                    // SliverPersistentHeader(
                    //     pinned: true,
                    //     floating: false,
                    //     delegate: MySliverAppBar(height: size.height * 0.1
                    //         //expandedHeight: MediaQuery.of(context).size.height * .4
                    //         )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext ctx2, int i) {
                      return Column(
                        children: [LandingPage()],
                      );
                    }, childCount: 1))
                  ];
                },
                body: CustomScrollView(
                  slivers: _slivers(),
                ),
                // slivers: [
                //   SliverPersistentHeader(
                //       pinned: true,
                //       delegate: MySliverAppBar(
                //           expandedHeight: MediaQuery.of(context).size.height * .4)),
                //   // SliverToBoxAdapter(
                //   //   key: _controller.headerGlobalKey,
                //   //   child: Container(
                //   //     //padding: EdgeInsets.all(kDefaultPadding),
                //   //     constraints: BoxConstraints(maxWidth: kMaxWidth),
                //   //     child: SafeArea(child: Header()),
                //   //   ),
                //   // ),
                //   ..._slivers()
                // ],
              ),
            ),
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
          key: _controller.timelineGlobalKey,
          child: Timeline(),
        ),
        SliverToBoxAdapter(
          key: _controller.projectGlobalKey,
          child: Projects(),
        ),
        SliverToBoxAdapter(
          key: _controller.contactGlobalKey,
          child: Contact(),
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
            onPressed: () {
              if (showFab) {
                //scroll to top
              }
            }, // make sure user cannot click when button hidden
            mini: true,
            child: Icon(Icons.arrow_upward, size: 20),
          ),
        );
      },
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final height;

  MySliverAppBar({this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return MyAppBar();
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
