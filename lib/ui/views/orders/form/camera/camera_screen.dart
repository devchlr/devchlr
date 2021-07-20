import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/order/form/cameraMV.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/views/orders/form/camera/thumbails/image.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/ui/views/orders/form/camera/display_picture_screen.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;


// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final List<CameraDescription> camera;
  OrderPackageInformation?packageInformation;
  OrderRecipientInformation?recipientInformation;
  OrderDeliveryInformation?deliveryInformation;
  double? order_km;
  double?order_price;
  TakePictureScreen({
    Key? key,
    required this.camera,
    this.order_price,
    this.packageInformation,
    this.deliveryInformation,
    this.recipientInformation,
    this.order_km
  }) : super(key: key);
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  //image picker
  final _picker = ImagePicker();
  String? image;
  Future getImage()async{

    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    // final File file = File(pickedFile.path);
    print("${pickedFile!.path}");
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new DisplayPictureScreen(imagePath: pickedFile.path)));
  }
  @override
  CameraMV cameraMV=CameraMV();
  void initState(){
    super.initState();
    // cameraMV.init(widget.camera);
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera.first,
      // Define the resolution to use.
      ResolutionPreset.high,
    );
    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    cameraMV.deliveryInformation=widget.deliveryInformation;
    cameraMV.recipientInformation=widget.recipientInformation;
    cameraMV.packageInformation=widget.packageInformation;
    cameraMV.order_km=widget.order_km;
    cameraMV.order_price=widget.order_price;
  }
  int cameraId=0;
  bool flashModeIsOn=false;
  Future initCamera(CameraDescription camera)async{
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(camera,ResolutionPreset.high);
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_controller.value.hasError) {
      print('Camera Error ${_controller.value.errorDescription}');
    }
    try {
      await _controller.initialize();
      _initializeControllerFuture = _controller.initialize();
    } catch (e) {
      String errorText = 'Error ${e} \nError message: ${e}';
    }
    if (mounted) {
      setState(() {});
    }
    // Next, initialize the controller. This returns a Future.
  }


  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CameraMV>(
      create: (context) => CameraMV(),
      child: Consumer<CameraMV>(
        builder: (context, model, child) =>
            Scaffold(
              body: Stack(
                children: [
                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final size = MediaQuery.of(context).size;
                        final deviceRatio =size.width / size.height;
                        final scale = 1 / (_controller.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
                        return Transform.scale(
                          scale: scale,
                          alignment: Alignment.topCenter,
                          child:new CameraPreview(
                            _controller,
                          ),
                        );
                      } else {
                        return LoadingForm();
                      }
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: 50,
                              left: MediaQuery.of(context).size.width*0.8
                          ),
                          child:Row(
                              crossAxisAlignment:CrossAxisAlignment.end,
                              children:[
                                GestureDetector(
                                  onTap:()async{
                                    model.changeFlashMode(_controller);
                                  },
                                  child: SvgIconButton(
                                    iconSize: 50,
                                    iconAsset: SvgIcons.flash_on,
                                    iconColor: Colors.white,)
                              ),]
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height*0.05,
                          ),
                          child:Row(
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                              children:[
                                Images(onTap:() {
                                  model.deliveryInformation=widget.deliveryInformation;
                                  model.recipientInformation=widget.recipientInformation;
                                  model.packageInformation=widget.packageInformation;
                                  model.order_km=widget.order_km;
                                  model.order_price=widget.order_price;
                                  model.getImage(context);
                                  },),
                                GestureDetector(
                                  onTap: () async {
                                    model.deliveryInformation=widget.deliveryInformation;
                                    model.recipientInformation=widget.recipientInformation;
                                    model.packageInformation=widget.packageInformation;
                                    model.order_km=widget.order_km;
                                    model.order_price=widget.order_price;
                                     await model.takePhoto(context, _initializeControllerFuture, _controller);
                                    // try {
                                    //   // Ensure that the camera is initialized.
                                    //   await _initializeControllerFuture;
                                    //
                                    //   // Attempt to take a picture and get the file `image`
                                    //   // where it was saved.
                                    //   final image = await _controller.takePicture();
                                    //
                                    //   // If the picture was taken, display it on a new screen.
                                    //   print(image.path);
                                    //   await Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) => DisplayPictureScreen(
                                    //         // Pass the automatically generated path to
                                    //         // the DisplayPictureScreen widget.
                                    //         imagePath: image.path,
                                    //       ),
                                    //     ),
                                    //   );
                                    // } catch (e) {
                                    //   // If an error occurs, log the error to the console.
                                    //   print(e);
                                    // }
                                  },
                                  child:  SvgIconButton(
                                    iconSize: 89,
                                    iconAsset: SvgIcons.camera_take,
                                    iconColor: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: ()async{
                                    // print('oki ici c\'est 0');
                                    if(cameraId==0){
                                      print('oki ici c\'est 0');
                                      cameraId=1;
                                      await initCamera(widget.camera[1]);
                                    }else{
                                      print('oki ici c\'est 1');
                                      cameraId=0;
                                      await initCamera(widget.camera[0]);
                                    }
                                  },
                                  child: SvgIconButton(
                                    iconSize: 43,
                                    iconAsset: SvgIcons.change_camera,
                                    iconColor: Colors.white,),
                                ),
                              ]
                          )
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.4,
                      left: MediaQuery.of(context).size.width*0.0
                  ),
                    child: model.isLoading?LoadingForm(
                      bgColor: Colors.white,
                    ):Container(),
                  )
                ],
              ),
            ),
      ),
    );
  }
}



// A widget that displays the picture taken by the user.
