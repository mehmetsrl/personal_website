import 'dart:js';

import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NavBarLogo extends StatelessWidget {
  final String logoImagePath;
  final Size bounds;
  final Decoration decoration;
  const NavBarLogo(this.logoImagePath,this.bounds,{Key key,this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5,color: Colors.blue),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      // image: BusyImage(imageProvider: NetworkImage(logoImageUrl)).imageProvider,  
                      image: NetworkImage(logoImagePath),
                      fit: BoxFit.fill),
                      ),
                  height: bounds.height,
                  width: bounds.width,
                );
  }
}
