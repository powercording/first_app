import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyName, currencyValue, currencySymbol;
  final IconData currencyIcon;
  final bool? isOdd;
  final Color bgColor, textColor;
  final double offsetValue, order, offset;

  const CurrencyCard({
    Key? key,
    required this.currencyName,
    required this.currencyValue,
    required this.currencySymbol,
    required this.currencyIcon,
    required this.order,
    this.isOdd = false,
    this.offsetValue = 20,
  })  : bgColor = isOdd == true ? const Color(0xFF212121) : Colors.white,
        textColor = isOdd == true ? Colors.white : const Color(0xFF212121),
        offset = order * offsetValue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -offset),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currencyName,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        currencyValue,
                        style: TextStyle(color: textColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        currencySymbol,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(5, 10),
                  child: Icon(
                    currencyIcon,
                    size: 120,
                    color: textColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
