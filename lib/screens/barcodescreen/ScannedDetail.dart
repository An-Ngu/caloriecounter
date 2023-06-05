import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../service/utils/ProductApi.dart';

class DetailPage extends StatefulWidget {
  Product product;

  DetailPage({
    super.key,
    required this.product,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gramms = 50;
  double cal = 0;
  late Timer _timer;

  final fieldText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setServiceSizeAsDefault();
    super.initState();
  }

  clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtons(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_return_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: widget.product.product.imageUrl == null
                      ? Image.asset(
                    "assets/icons/nopictures.png",
                    scale: 2.5,
                  )
                      : Image.network(
                    widget.product.product.imageUrl!,
                    scale: 2,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.product.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: Text(
                          "Artikel Nr.: ${widget.product.product.code!}",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getNutriScore(),
                    Icon(
                      size: 32,
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                nutritionData(size),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonIncreaseDecrease((-1)),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(16)),
                      child: grammIndikator(),
                    ),
                    buttonIncreaseDecrease((1)),
                  ],
                ),
                showIngredients(),
                Text(widget.product.toString())
              ],
            ),
          ),
        ));
  }

  TextField grammIndikator() {
    return TextField(
      onSubmitted: (String? string) {
        clearText();
        gramms = int.parse(string!);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: "${gramms.toString()} g"),
      controller: fieldText,
      onTap: () {
        setState(() {
          setServiceSizeAsDefault();
        });
      },
      textAlign: TextAlign.center,
    );
  }

  GestureDetector buttonIncreaseDecrease(int value) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: value > 0 ? Color(0x6179ff80) : Color(0x4cff5555),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black38)),
      ),
      onTapDown: (TapDownDetails details) {},
      onLongPress: () {
        _timer = Timer.periodic(Duration(milliseconds: 200), (t) {
          setState(() {
            _timer.tick > 5
                ? _grammCounter(value * 100)
                : _grammCounter(value * 20);
          });
        });
      },
      onLongPressUp: () {
        print("up!");
        setState(() {
          _roundUpGramm();
        });
        _timer.cancel();
      },
      onTap: () {
        setState(() {
          _grammCounter(value);
        });
      },
    );
  }

  Row nutritionData(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.product.product.nutriments?.energyKcal100G == null
            ? Container()
            : nutritile(
            size,
            ((widget.product.product.nutriments!.energyKcal100G! / 100) *
                gramms),
            "Energie",
            "kcal"),
        widget.product.product.nutriments?.proteins100G == null
            ? Container()
            : nutritile(
            size,
            ((widget.product.product.nutriments!.proteins100G! / 100) *
                gramms),
            "Eiweiß",
            "g"),
        widget.product.product.nutriments?.fat100G == null
            ? Container()
            : nutritile(
            size,
            ((widget.product.product.nutriments!.fat100G! / 100) * gramms),
            "Fett",
            "g"),
        widget.product.product.nutriments?.sugars100G == null
            ? Container()
            : nutritile(
            size,
            ((widget.product.product.nutriments!.sugars100G! / 100) *
                gramms),
            "Zucker",
            "g"),
      ],
    );
  }

  Padding floatingButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Add"),
              icon: const Icon(Icons.receipt)),
          FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Add"),
              icon: const Icon(Icons.add_circle_outline_rounded)),
        ],
      ),
    );
  }

  showIngredients() {
    return widget.product.product.ingredients != null
        ? getIngredientsAsString()
        : Container();
  }

  Expanded nutritile(Size size, double nutriments, String nutriname,
      String unit) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              padding: EdgeInsets.all(6),
              height: size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black38)),
              child: Text("$nutriname: ${nutriments.roundToDouble()}$unit", style:
              TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),)),
        ));
  }

  getIngredientsAsString() {
    List<String> list = [];
    for (Ingredient ingredient in widget.product.product.ingredients!) {
      list.add(ingredient.text!);
    }
    return Text(
      "Zutaten: ${list.join(", ")}",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  _grammCounter(int plus) {
    print("Trigered add $plus");
    setState(() {
      gramms = gramms + plus;
    });
  }
  _roundUpGramm() {
    setState(() {
    });
  }


    getNumber(String? servingSize) {
      String a = servingSize!.replaceAll(new RegExp(r'[^0-9]'), '');
      a == "0"? a = "100" : a = servingSize!;
      setState(() {
        gramms = int.parse(a);
      });
      return a;
    }

    void setServiceSizeAsDefault() {
      widget.product.product.productQuantity != null
          ? getNumber(widget.product.product.productQuantity)
          : widget.product.product.servingSize != null ?
      getNumber(widget.product.product.servingSize) : gramms = 100;
    }

    getNutriScore() {
      if (widget.product.product.nutriscoreGrade != null) {
        String grade = widget.product.product.nutriscoreGrade!;
        return Image.asset(
          "assets/icons/nutriscore${grade}.png",
          scale: 9,
        );
      }
      return Container();
    }
  }
