import 'package:flutter/material.dart';
import 'package:infoflight/data/products_data.dart';

class ProductItem extends StatefulWidget {
  final Products product;
  final ValueChanged<bool> onSelected;

  const ProductItem({
    Key? key,
    required this.product,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}


class _ProductItemState extends State<ProductItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isSelected = !_isSelected;
        widget.onSelected(_isSelected);
      }),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: _isSelected
                      ? Border.all(
                          width: 2.0,
                          color: Colors.orange,
                        )
                      : null),
              child: Icon(widget.product.icon,
              color: Theme.of(context).colorScheme.primaryContainer,),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(widget.product.label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),),
          ],
        ),
      ),
    );
  }
}
