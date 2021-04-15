import 'package:flutter/material.dart';
import 'package:flutter_resume_pdf/config/constants.dart';
import 'package:flutter_resume_pdf/controllers/menu_controller.dart';
import 'package:get/get.dart';

import 'components/about.dart';
import 'components/experience.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

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
            SliverToBoxAdapter(
              key: _controller.headerGlobalKey,
              child: Container(
                //padding: EdgeInsets.all(kDefaultPadding),
                constraints: BoxConstraints(maxWidth: kMaxWidth),
                child: SafeArea(child: Header()),
              ),
            ),
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
