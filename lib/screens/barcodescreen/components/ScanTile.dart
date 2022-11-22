import 'package:flutter/material.dart';

import '../../../service/utils/ProductApi.dart';
import '../ScannedDetail.dart';

class ScanTile extends StatefulWidget {
  Product product;
  Function onPressed;

  ScanTile({Key? key, required this.product, required this.onPressed})
      : super(key: key);

  @override
  State<ScanTile> createState() => _ScanTileState();
}

class _ScanTileState extends State<ScanTile> {
  Product? selectedProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(product: widget.product)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Color(0xfff6f6f6),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Text(widget.product.product.productName),
            subtitle: Text(widget.product.code),
            leading: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: widget.product.product.imageUrl == null
                    ? Image.asset("assets/icons/nopictures.png", scale: 2,)
                    : Image.network(widget.product.product.imageUrl!),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                widget.onPressed(widget.product.product.code);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
