import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';


class CommonInput extends StatefulWidget{

  final String placeholder;
  final String title;
  final bool autofocus;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;

  CommonInput({
    Key key,
    this.placeholder,
    this.title,
    this.autofocus,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.onChanged

  }) : super(key: key);

  @override
  CommonInputState createState() => CommonInputState();

}


class CommonInputState extends State<CommonInput> {

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;


      return Container(
        alignment: Alignment.center,
        // height: 106,
        // width: width,
        margin: EdgeInsets.all(3.0),
      
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child:Stack(
            children: <Widget>[
              Image.asset(
              ImageHelper.wrapAssets('inputbg.png'),
              fit: BoxFit.fill,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 70),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 45, 50, 0),
                child: TextField(
                  onChanged: widget.onChanged,
                  
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(color: Colors.lightBlue, fontSize: 17.0),
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0),),  
                    )
                  )
                ),
              
              ),


            ],
          ) 
          

          
          
        ),
        // color: Colors.blue,
      );
  }
}

// 文本框border
InputBorder TextFieldDecorationBorder() {
  return new OutlineInputBorder(
      borderSide: new BorderSide(color: Color(0xffd2d2d2), width: 0.6),
      borderRadius: new BorderRadius.circular(6.0)
  );
}