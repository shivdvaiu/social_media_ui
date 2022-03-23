import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:igeku/core/constant/constant.dart';
import 'package:igeku/ui/shared/themes.dart';
import 'package:igeku/ui/widgets/bottom_nav_bar.dart';
import 'package:igeku/ui/widgets/dummy_users.dart';
import 'package:igeku/ui/widgets/glassmorphism.dart';
import 'package:igeku/ui/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// Chats and edit
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText("IGEKU",
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primaryContainer
                        ],
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),

                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withOpacity(0.4),
                              blurRadius: 3.0,
                              offset: Offset(1, 3)),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.8),
                          size: 32,
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 2.h,
            ),

            _horizontalUsersContainers(),

            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _usersCard(context),
                    _cardWithImage(context),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Padding _cardWithImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 54.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 20,
            ),
            ClipOval(
              child: Container(
                child: Image.network(
                  Constants.usersModel[1].userNetworkImage,
                  height:50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topCard(1, context),
                  Text(
                    "@carlavilhena",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(fit: StackFit.expand, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    child: Image.network(
                      Constants.city,
                      fit: BoxFit.fill,
                    ),
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GlassMorphism(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          height: 6.h,
                        ),
                        start: 0.5,
                        end: 0.3)),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.chat, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "10",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 10.sp,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.favorite, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 10.sp,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.send, color: Colors.white),
                        ]),
                        Icon(Icons.bookmark, color: Colors.white),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Spacer(),
          // _cardBottom(context)
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }

  Widget _usersCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 30.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 20,
            ),
            ClipOval(
              child: Container(
                child: Image.network(
                  Constants.usersModelTwo[0].userNetworkImage,
                   height:50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _topCard(0, context),
                  Text(
                    "@shanepriscillia",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              Constants.usersModel[0].comment,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 10.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.8),
                  ),
            ),
          ),
          Spacer(),
          _cardBottom(context)
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }

  Container _horizontalUsersContainers() {
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Constants.usersModelTwo.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: [
              Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer
                    ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(2),
                      child: DecoratedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: Container(
                              child: Image.network(
                                  Constants
                                      .usersModelTwo[index].userNetworkImage,
                                  fit: BoxFit.cover),
                              height: 7.h,
                              width: 15.w,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ))),
              SizedBox(
                height: 4,
              ),
              Expanded(
                child: Text(
                  Constants.usersModelTwo[index].userName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 9.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _cardBottom(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              RadiantGradientMask(
                  child: Icon(
                Icons.chat,
                color: Colors.white,
              )),
              SizedBox(
                width: 10,
              ),
              Text(
                "12",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 10.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              SizedBox(
                width: 20,
              ),
              RadiantGradientMask(
                  child: Icon(Icons.favorite, color: Colors.white)),
              Text(
                "10",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 10.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              SizedBox(
                width: 20,
              ),
              RadiantGradientMask(child: Icon(Icons.send, color: Colors.white)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          RadiantGradientMask(
            child: Icon(
              Icons.bookmark_outlined,
              color: Colors.white,
            ),
          ),
        ]),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: ([
                Color.fromARGB(255, 211, 224, 243),
                Color(0xffDFE9FA),
              ]))),
      height: 50,
    );
  }

  Widget _topCard(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                index == 0 ? 'Priscillia Shane' : "Carla Vihena",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 2.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Icon(
                      Icons.done_outlined,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_vert_outlined,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
          ),
        ],
      ),
    );
  }

  SizedBox _verticalSpace() => SizedBox(height: 20);
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color(0xff8a4cff),
          Color.fromARGB(255, 142, 168, 209),
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
