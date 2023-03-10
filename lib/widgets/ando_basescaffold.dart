import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget Function(
    Size size,
  ) builder;
  final Widget? bottomNavBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool safeTop;
  final Widget? appBarAction;
  final bool safeBottom;
  final VoidCallback? onBackPressed;
  final Widget? floatingActionButton;
  final bool includeHorizontalPadding;
  final bool showAppBar;
  final Widget? appBarIcon;
  final bool includeVerticalPadding;
  const BaseScaffold(
      {Key? key,
      required this.builder,
      this.floatingActionButton,
      this.showAppBar = true,
      this.appBar,
      this.appBarTitle,
      this.bottomNavBar,
      this.drawer,
      this.endDrawer,
      this.scaffoldKey,
      this.backgroundColor,
      this.resizeToAvoidBottomInset = true,
      this.safeTop = true,
      this.safeBottom = true,
      this.onBackPressed,
      this.includeHorizontalPadding = true,
      this.appBarAction,
      this.includeVerticalPadding = true,
      this.appBarIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        Size constraints = Size(constraint.maxWidth, constraint.maxHeight);
        return GestureDetector(
          onTap: () {
            //unfocus any active TextField
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            floatingActionButton: floatingActionButton,
            backgroundColor: backgroundColor ?? Colors.white,
            key: scaffoldKey,
            drawer: drawer,
            endDrawer: endDrawer,
            appBar: appBar,

            /// refactor the appbar when we get the mobile design

            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            bottomNavigationBar: bottomNavBar,
            body: SafeArea(
              top: safeTop,
              bottom: safeBottom,
              child: Builder(
                builder: (_) => Container(
                  width: constraints.width,
                  height: constraints.height,
                  margin: EdgeInsets.symmetric(
                      horizontal: includeHorizontalPadding ? 20.w : 0.w,
                      vertical: includeVerticalPadding ? 20.h : 0.w),
                  child: builder(
                    constraints,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
