import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff00a368)),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
        GridView.count(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for (int i = 1; i < 9; i++)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "itemPage");
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            "images/img$i.png",
                            height: 110,
                            width: 110,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Item title",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff555555),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Fresh Food 2KG",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "20.00",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff00a368),
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00a368),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        )),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
