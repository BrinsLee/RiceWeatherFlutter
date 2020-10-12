import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:rice_weather/app/utils/print_utils.dart';
import 'package:rice_weather/app/utils/shared_preference_util.dart';
import 'package:rice_weather/app/utils/toast.dart';
import 'package:rice_weather/bloc/city/city_bloc.dart';
import 'package:rice_weather/bloc/city/city_event.dart';
import 'package:rice_weather/bloc/city/city_state.dart';
import 'package:rice_weather/model/city_model_entry.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  var locationState;
  var title = "未知";

  @override
  void initState() {
    super.initState();
  }

  Widget _buildHomeContent(List<CityModel> cityModels) {
    weatherPrint("build home content: ${cityModels?.length}");
    return Column(
      children: [Expanded(child: Text("主界面"))],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                    .padding
                    .top),
            child: BlocBuilder<CityBloc, CityState>(builder: (context, state) {
              if (state is CitySucess) {
                return _buildHomeContent(state.cityModels);
              } else if (state is CityInit) {
                if (locationState == null) {
                  locationState = LocatePermissionState.loading;
                  requestPermission();
                } else if (locationState == LocatePermissionState.success) {
                  //发送事件
                  BlocProvider.of<CityBloc>(context)
                      .add(RequestLocationEvent());
                }
                return Container(
                  alignment: Alignment.center,
                  child: Container(),
                );
              } else if (state is LocationSuccessState) {
                return Container(
                  alignment: Alignment.center,
                  child: Container(),
                );
              }
            }),
          )
        ],
      ),
    );
  }

  Future<Null> requestPermission() async {
    await Future.delayed(Duration(seconds: 2));
    var permissionState = await LocationPermissions().checkPermissionStatus();
    if (permissionState != PermissionStatus.granted) {
      permissionState = await LocationPermissions().requestPermissions(permissionLevel: LocationPermissionLevel.locationWhenInUse);
      if (permissionState == PermissionStatus.granted) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          locationState = LocatePermissionState.success;
        });
      } else {
        var models = await SPUtil.getCityModels();
        if (models == null || models.isEmpty) {}
        ToastUtils.show("请开启定位权限", context);
      }
    } else {
      setState(() {
        locationState = LocatePermissionState.success;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}

enum LocatePermissionState {
  success,
  loading,
  failed,
}
