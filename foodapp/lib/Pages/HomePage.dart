import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/widgets/CategoriesWidget.dart';
import 'package:foodapp/widgets/ItemWidget.dart';
import 'package:foodapp/widgets/PopularItemWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00a368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xff00a368),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: -10, end: -12),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: Colors.red,
                            padding: EdgeInsets.all(6),
                          ),
                          badgeContent: const Text(
                            "3",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              //welcome text
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("What do you want to order today?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              //search bar
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.all(15),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    const Icon(
                      Icons.search,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 250,
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search"),
                        )),
                    const Spacer(),
                    const Icon(Icons.filter_list),
                  ])),
              //products widget
              Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoriesWidget(),
                      PopularItemWidget(),
                      ItemWidget()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
