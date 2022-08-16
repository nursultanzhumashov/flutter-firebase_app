import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key,this.imageUrl});
final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,right: 10),
      child: Container(height: 150,width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
      border:  Border(bottom: BorderSide(width: 1,color: Theme.of(context).primaryColor,
      ),
      top:  BorderSide(width: 1,color: Theme.of(context).primaryColor),
      left: BorderSide(width: 1,color: Theme.of(context).primaryColor),
      right: BorderSide(width: 1,color: Theme.of(context).primaryColor)

      ),
      ),
      child: 
      (imageUrl == null)
     ? Center(child: Title(color: Colors.black, child: Text('No Image')),)
      : Image.network(imageUrl!,fit: BoxFit.cover,)
      ),
    );
  }
}