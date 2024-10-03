import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xFFE0F2F1)],
        ),
      ),
      child: Column(
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
                    color: Color(0xff00a368),
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
                _buildAnimatedSeeAll(),
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
              for (int i = 1; i < 9; i++) _buildItemCard(context, i),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAnimatedSeeAll() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(5 * _controller.value, 0),
          child: child,
        );
      },
      child: Text(
        "See All",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (index * 100)),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFE0F2F1)],
          ),
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
                  "images/img$index.png",
                  height: 110,
                  width: 110,
                ),
              ),
            ),
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
              ),
            ),
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
                  _buildAddToCartButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff00a368),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xff00a368).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
