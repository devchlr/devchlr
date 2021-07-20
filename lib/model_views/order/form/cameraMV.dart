import 'package:camera/camera.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/views/orders/form/camera/display_picture_screen.dart';
import 'package:image_picker/image_picker.dart';

class CameraMV extends BaseModel{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  OrderPackageInformation?packageInformation;
  OrderRecipientInformation?recipientInformation;
  OrderDeliveryInformation?deliveryInformation;
  double? order_km;
  double?order_price;

  //
  int cameraId=0;
  bool flashModeIsOn=false;
  bool isLoading=false;



  //prendre une photo
  Future<void> takePhoto(BuildContext context, Future<void> initializeControllerFuture,CameraController cameraController)async{
   isLoading=true;
   notifyListeners();
    try {
      await initializeControllerFuture;
      final image = await cameraController.takePicture();
      isLoading=false;
      notifyListeners();
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            deliveryInformation: deliveryInformation,
            recipientInformation: recipientInformation,
            packageInformation: packageInformation,
            order_km: order_km,
            order_price: order_price,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  //init state

  //change flash mode
  changeFlashMode(CameraController _controller )async{
    if(flashModeIsOn){
      await _controller.setFlashMode(FlashMode.off);
      flashModeIsOn=false;
      print('flash off');
    }else{
      await _controller.setFlashMode(FlashMode.torch);
      flashModeIsOn=true;
      print('flash on');
    }
  }



  //image picker
  var _picker = ImagePicker();
  String? image;
  Future getImage(BuildContext context)async{
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    // final File file = File(pickedFile.path);
    print("${pickedFile!.path}");
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new DisplayPictureScreen(imagePath: pickedFile.path,
              deliveryInformation: deliveryInformation,
              recipientInformation: recipientInformation,
              packageInformation: packageInformation,
              order_km: order_km,
              order_price: order_price,
            )));
  }

  //init camera
  Future initCamera(CameraDescription camera,CameraController _controller)async{
    if (_controller != null) {
      await _controller.dispose();
    }
    _controller = CameraController(camera,ResolutionPreset.high);
    _controller.addListener(() {
       notifyListeners();
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
     notifyListeners();

    // Next, initialize the controller. This returns a Future.
  }
}