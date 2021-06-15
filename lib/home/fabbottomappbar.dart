import 'package:flutter/material.dart';
import 'package:signal_main/chat/chat_list.dart';
import 'package:signal_main/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text, this.ppress});
  IconData iconData;
  String text;
  void ppress;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 75.0,
    this.iconSize: 30.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        //index: index,
       // onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: CircularNotchedRectangle(),//widget.notchedShape,
      notchMargin: 10.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({FABBottomAppBarItem item}) { //int index,ValueChanged<int> onPressed
   // Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => {if(item.text=="Chats"){_chat()}else{sendingPage(context).then((value) => null)}},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: Colors.deepPurple, size: widget.iconSize),
                Text(item.text, style: TextStyle(color: Colors.deepPurple),)
              ],
            ),
          ),
        ),
      ),
    );
  }




  void _chat() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => ChatList()),
            (route) => route == null);
  }


/*
  void initState() {
    super.initState();
    controller.text = '<initial value>';
    controller.addListener(() {
      setState(() {if(controller.text.isNotEmpty==true){_hascontent = true;}else{_hascontent=false;}}); // setState every time text changes
    });
  }
*/
 // bool _hascontent = false;
  TextEditingController controller = TextEditingController();
/*
  void _listen(){
  controller.addListener(() {
  setState(() {if(controller.text.isNotEmpty==true){_hascontent = true;}else{_hascontent=false;}}); // setState every time text changes
  });}
*/
Future<String> sendingPage(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible:
        false, // can not be closed by clicking outside border
        builder: (context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(left:0, top:10, right:0, bottom:0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              /*title: Text(
                "Send a signal",
                textAlign: TextAlign.center,
                style: GoogleFonts.patuaOne( //quicksand  patuaOne
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                  fontSize: 25,

                ),
              ),*/
              content: Container(
                height: 340,
               width: 300,
               child: Column(
                  //overflow: Overflow.visible,
                 // alignment: Alignment.center,
                  children: <Widget>[
                   // Positioned(
                     //   right: 0.0,
                     // child:
                      Container(
                        alignment: Alignment.topRight,
                        height:30,
                        width: 300,
                        child: FloatingActionButton(//FloatingActionButton(
                        child: Icon(Icons.close,size: 30, color: Colors.grey,),
                            onPressed: (){Navigator.pop(context);},
                           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,

                        mini: true,
                        elevation: 0.0,
                      ),
                    ),
                   // ),
                    Container(
                      height: 40,
                      child: Text(
                        "Send a signal",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.patuaOne( //quicksand  patuaOne
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                          fontSize: 25,

                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left:15.0, top:10, right:15, bottom:0,),
                        height: 270,
                        child: Column(
                          //新建一个Column来放文字信息，发件人名字和最近信息
                            crossAxisAlignment:
                            CrossAxisAlignment.center, //左对齐
                            children: [
                              Container(
                                height: 3,
                                width: 50,
                                color: Colors.grey[300],
                              ),
                              Container(
                                  padding: EdgeInsets.only(left:20.0, top:0, right:20, bottom:0,),
                                  height: 190,
                                  width: 400,
                                  child:TextField(
                                    style: new TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w500,color: Colors.deepPurple),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: 'Write your message...',
                                      hintStyle: TextStyle(
                                        color: Colors.deepPurple.withOpacity(0.4),//grey[400],
                                        fontSize: 15,
                                      ),
                                    ),
                                    controller: controller,
                                    //  onChanged: (String value)async{if(value!=''){return _hascontent=true; }},
                                  )),

                              Container(
                                  height: 50,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 0.5,
                                          offset: Offset(0.0, 1)),
                                    ],
                                  ),
                                  child: RaisedButton(//MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.deepPurple)),
                                      elevation: 5.0,
                                      //minWidth: 320,
                                     // height: 50,
                                      color: Colors.deepPurple,//:Colors.grey,
                                      //padding: EdgeInsets.symmetric(vertical: 15.0),
                                      onPressed: () {
                                        Navigator.of(context).pop(controller.text.toString());
                                       // sendingImage(context);
                                      },
                                      child: Text(
                                        "Send",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ))),
                            ]))])));
        });

  }


}