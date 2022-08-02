import 'package:flutter/material.dart';
import 'package:sample/utils/constants.dart';
import 'package:sample/view/listing_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colorconstants.colorF1EFFF,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchArea(context),
                const SizedBox(height: 25),
                const ListingView()
              ],
            ),
          ),
          bottomNavigationBar: bottomBar(size),
        )));
  }

  Container searchArea( BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colorconstants.color9745FF.withOpacity(.6),
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0)),
      ),
      child: Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, bottom: 25, top: 20),
          padding: const EdgeInsets.only(left: 0),
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colorconstants.color1A059D.withOpacity(.52), width: 1),
            color: Colorconstants.colorFFFFFF,
          ),
          child: TextFormField(
            controller: _controller,
            onTap: () {},
            autofocus: false,
            cursorColor: Colorconstants.color1A059D,
            style: TextStyle(
              color: Colorconstants.color1A059D,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 15,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colorconstants.color1A059D,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colorconstants.color1A059D,
                    size: 15,
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colorconstants.color1A059D,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
                border: InputBorder.none),
            onChanged: (value) {},
          )),
    );
  }

  Container bottomBar(Size size) {
    return Container(
      height: 75,
      width: size.width,
      color: Colorconstants.color9745FF,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("favorites ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 15,
                letterSpacing: 1,
              )),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text("favorite",
                      style: TextStyle(
                        color: Colorconstants.color1A059D,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        letterSpacing: 1,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
