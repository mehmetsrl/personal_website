
import 'package:flutter/material.dart';

class BusyImage extends StatefulWidget {
  BusyImage({
    Key key,
    @required this.imageProvider,
  }) : assert(imageProvider != null),
       super(key: key);

  bool _busy = false;
  final ImageProvider imageProvider;

  @override
  _BusyImageState createState() => _BusyImageState();
}

class _BusyImageState extends State<BusyImage> {
  ImageStream _imageStream;
  ImageInfo _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(BusyImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider)
      _getImage();
  }

  void _getImage() {
    widget._busy=true;
    final ImageStream oldImageStream = _imageStream;
    _imageStream = widget.imageProvider.resolve(createLocalImageConfiguration(context));
    if (_imageStream.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo = imageInfo;
      widget._busy=false;
    });
  }

  @override
  void dispose() {
    _imageStream.removeListener(ImageStreamListener(_updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget._busy?
            CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)):
            RawImage(
              image: _imageInfo?.image, // this is a dart:ui Image object
              scale: _imageInfo?.scale ?? 1.0,
    );
  }
}