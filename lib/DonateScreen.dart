import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

int donate = 0;

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('images/dog1.png'))),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
                child: Material(
                  color: Colors.black.withOpacity(.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  //elevation: 18,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 220,
                      child: Column(
                        children: [
                          _titleContainer(),
                          _priceContainer(),
                          _donateConainer(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hound',
                style: TextStyle(
                    color: Colors.orangeAccent.withOpacity(.8),
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3),
              ),
              Text(
                'He is a loyal friend',
                style: TextStyle(
                    color: Colors.orangeAccent.withOpacity(.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Padding(
            padding: const EdgeInsets.only(right: 28),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    donate = 0;
                  });
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                )),
          ),
        )
      ],
    );
  }

  Widget _priceContainer() {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              setState(() {
                donate--;
              });
            },
            child: const Icon(
              FontAwesomeIcons.minus,
              color: Colors.orangeAccent,
              size: 26,
            ),
            shape: const CircleBorder(),
            elevation: 3,
            fillColor: Colors.white,
          ),
          Text(
            '\u0024 ${donate}',
            style: const TextStyle(
                fontSize: 26,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.w600),
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                donate++;
              });
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.orangeAccent,
              size: 26,
            ),
            shape: const CircleBorder(),
            elevation: 3,
            fillColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _donateConainer() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Donate Now',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.paw,
                      color: Colors.orangeAccent,
                      size: 26,
                    )
                  ],
                ),
                onPressed: () {
                  if (donate >= 1) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.orangeAccent.withOpacity(.7),
                      content: Text(
                        'Hey! Thank you for donating \u0024$donate',
                        style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ));
                  }
                })
          ],
        ));
  }
}
