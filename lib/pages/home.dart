import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _phone = '0';
  String _message = '';

  void launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter a valid number..!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const whatsapp = 'assets/whatsapp.svg';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Mclaren',
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: size.height * 0.05,
          child: Center(
            child: Text(
              'Developed by:    K T N',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Mclaren',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Text('Enter Number to Start Chatting',
                        style: TextStyle(
                          fontFamily: 'Mclaren',
                          fontSize: 30,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Number'),
                      TextField(
                        onChanged: (String text) => _phone = text,
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter phone number to Chat',
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Mclaren',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text('Message'),
                      TextField(
                        onChanged: (String text) => _message = text,
                        autofocus: false,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Message (Optional)',
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Mclaren',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.teal,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _phone.length == 10
                          ? setState(() {
                              _launchInBrowser(
                                  'https://wa.me/91$_phone?text=$_message');
                            })
                          : _showMyDialog();
                    },
                    color: Colors.teal.withOpacity(0.1),
                    label: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Click2Chat',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Mclaren',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
                      child: SvgPicture.asset(
                        whatsapp,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
