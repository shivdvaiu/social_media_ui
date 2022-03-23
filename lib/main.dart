import 'package:flutter/material.dart';
import 'package:igeku/core/services/navigations/routes.dart';
import 'package:igeku/ui/shared/themes.dart';
import 'package:igeku/ui/view_model/base_view_model/base_view_model.dart';
import 'package:igeku/ui/view_model/view_model.dart';
import 'package:igeku/ui/views/base_view/base_view.dart';
import 'package:igeku/ui/views/home_view/home_view.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BaseViewModel()),
        ],
        child: MaterialApp(
          
          initialRoute:Routes.baseView,
          home: Igeku(),
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          theme: primaryMaterialTheme,
        ),
      );
    },
  ));
}

class Igeku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView();
  }
}
