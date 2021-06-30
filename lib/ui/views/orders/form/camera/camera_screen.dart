import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/order/cameraMV.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  //image picker
  File? _image;
  final _picker = ImagePicker();

  Future getImage()async{
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile!.path);
    print("file:${file.path}");
    MaterialPageRoute(
      builder: (context) => DisplayPictureScreen(
        // Pass the automatically generated path to
        // the DisplayPictureScreen widget.
        imagePath: file.toString(),
      ),
    );
  }

  @override

  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 50,
                                left: MediaQuery.of(context).size.width*0.8
                            ),
                            child:Row(
                                crossAxisAlignment:CrossAxisAlignment.end,
                                children:[ SvgIconButton(
                                  iconSize: 50,
                                  iconAsset: SvgIcons.flash_on,
                                  iconColor: Colors.white,),]
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height*0.05,
                            ),
                            child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children:[
                                  GestureDetector(
                                    onTap:getImage,
                                    child: Icon(Icons.panorama,size: 50,color: Colors.white,),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
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
                                      iconSize: 100,
                                      iconAsset: SvgIcons.camera_take,
                                      iconColor: Colors.white,
                                    ),
                                  ),
                                  SvgIconButton(
                                    iconSize: 50,
                                    iconAsset: SvgIcons.change_camera,
                                    iconColor: Colors.white,),
                                ]
                            )
                        ),
                      ],
                    ),
                  ),
                );
                //   Stack(
                //   children: [
                //
                //     // Center(
                //     //   child:Transform.scale(
                //     //     scale: _controller.value.aspectRatio/deviceRatio,
                //     //     child: new AspectRatio(
                //     //       aspectRatio: _controller.value.aspectRatio,
                //     //       child: ,
                //     //     ),
                //     //   ),),
                //
                //                      ],
                // );
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     // Take the Picture in a try / catch block. If anything goes wrong,
      //     // catch the error.
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;
      //
      //       // Attempt to take a picture and get the file `image`
      //       // where it was saved.
      //       final image = await _controller.takePicture();
      //
      //       // If the picture was taken, display it on a new screen.
      //       await Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => DisplayPictureScreen(
      //             // Pass the automatically generated path to
      //             // the DisplayPictureScreen widget.
      //             imagePath: image.path,
      //           ),
      //         ),
      //       );
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //       print(e);
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),
    ),),);
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return
      Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 100.0,
            child: Center(
              child: AspectRatio(
                aspectRatio: 50.0,
                child:Image.file(File(imagePath)),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.87
          ),
          child: Container(
            height: 130.0,
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0
            ),
            color: Color(0x6B242424),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Reprendre',style: AppTextStyle.appBarHeader(
                      color: ChaliarColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontFamilly.montserrat,
                      size: 14
                  ),),
                ),
                ButtonChaliar(
                    onTap: () {
                      Navigator.pushNamed(context, '/resume_order_screen');
                    },
                    buttonText: 'Je Valide',
                    height: MediaQuery.of(context).size.height * 0.07,
                    mediaQueryWidth: 0.20,
                    borderRaduis: 41,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.button(
                        color: ChaliarColors.whiteColor)),
              ],
            ),
          ),
          )
        ],
      ),
    );
  }
}