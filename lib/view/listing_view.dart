import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ListingView extends StatefulWidget {
  const ListingView({
    Key? key,
  }) : super(key: key);

  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return singleCard(context, index);
        },
      ),
    );
  }

  GestureDetector singleCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin:  const EdgeInsets.only(left: 10,bottom: 10,right: 10),
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colorconstants.color1A059D)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.shutterstock.com/image-vector/global-network-connection-concept-big-260nw-1722533119.jpg"),
                                fit: BoxFit.cover))))),
            const SizedBox(
              width: 15,
            ),
            Text(
              "title",
              style: TextStyle(
                color: Colorconstants.color1A059D,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 15,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite_sharp, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
