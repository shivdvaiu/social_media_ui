import 'package:flutter/material.dart';
import 'package:igeku/core/assets_path/assets_path.dart';
import 'package:igeku/core/constant/constant.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            fit: BoxFit.fill,
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 84,
                                width: 84,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                  ]),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: DecoratedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ClipOval(
                                          child: Container(
                                            child: Image.network(
                                                Constants.usersModelTwo[0]
                                                    .userNetworkImage,
                                                fit: BoxFit.cover),
                                            height: 7.h,
                                            width: 15.w,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ))),
                            _options(context, "703", "Post"),
                            SizedBox(
                              width: 5,
                            ),
                            _options(context, "115k", "Followers"),
                            SizedBox(
                              width: 5,
                            ),
                            _options(context, "12", "Following"),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 18),
                                child: Icon(Icons.arrow_downward,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 15),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text("Jessic Rira Ikutann",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 11.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                )),
                        Text("@riraikutann",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 10.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        Row(
                          children: [
                            Expanded(
                              child: TabBar(
                                indicatorColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                labelColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 11.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                            fontWeight: FontWeight.bold
                                            ),
                                unselectedLabelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 11.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                tabs: [
                                  Tab(
                                    text: "Media",
                                  ),
                                  Tab(
                                    text: "Status",
                                  ),
                                  Tab(
                                    text: "Bio",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 90,),
                            Icon(
                              Icons.apps_outlined,
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            Container(),
                            Container(),
                            Container()
                          ]),
                        )
                      ]),
                ),
                decoration: BoxDecoration(
                    color: Color(0xfff9f9f9),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        topLeft: Radius.circular(22))),
                height: 70.h,
                width: double.infinity,
              )),
          Positioned(
              top: 40,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.black,
                  ),
                ),
              )),
          Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              child: Text("Logout"),
                              value: 1,
                            ),
                          ];
                        },
                        child: Icon(
                          Icons.more_vert_outlined,
                        )),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _options(BuildContext context, String data, title) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffffffff), borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(data,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold)),
            Text(title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 8.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7),
                    ))
          ]),
        ),
      ),
    );
  }
}
