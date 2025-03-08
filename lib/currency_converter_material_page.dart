import 'package:flutter/material.dart';

/// A Flutter StatefulWidget that implements a simple currency converter.
/// Converts USD to INR with a fixed exchange rate.
class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // Stores the converted INR value
  double result = 0;

  // Controller for the input text field to capture user input
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Defines a common border style used in the input field
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 3.0),
      borderRadius: const BorderRadius.all(Radius.circular(0)),
    );

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: const Text('Curreny Converter'),
        backgroundColor: Colors.blueGrey,
        elevation: 50, // Adds depth effect to AppBar
        centerTitle: true, // Centers the title in the AppBar
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
      ),

      // Main UI centered on the screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Aligns elements to the center
          children: [
            // Displays the converted currency result
            Container(
              padding: const EdgeInsets.all(
                10.0,
              ), // related to the gap between stuff inside and border
              margin: const EdgeInsets.all(
                10.0,
              ), // related to the gap between border and stuff outside
              color: Colors.blueGrey, // takes only the text space
              child: Text(
                'INR ${result.toString()}', // Display the converted amount
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            // Input field for entering USD value
            Padding(
              // container is the collection of many widgets while padding is one of them
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.all(8.0), Available only for container widget
              child: TextField(
                controller: textEditingController, // Controller for input text
                style: const TextStyle(color: Colors.black), // Text color
                decoration: InputDecoration(
                  // label: Text(
                  //   'Please Enter Value in INR',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  hintText: "Please Enter Value in USD", // Placeholder text
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ), // if wanna add after text then use suffix instead of prefix everything else same
                  prefixIconColor: Colors.black,
                  filled: true, // Enables background color for input field
                  fillColor: Colors.white, // Background color of input field

                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: const BorderSide(
                  //     color: Colors.black,
                  //     width: 3.0,
                  //     style: BorderStyle.solid,
                  //     strokeAlign:
                  //         BorderSide
                  //             .strokeAlignOutside, // THIS WILL SET COLOR TO OUTSIDE OF BOUNDRY
                  //     // strokeAlign: BorderSide.strokeAlignCenter, THIS WILL SET BOUNDRY COLOR TO CENTER OF THE BOUNDRY
                  //   ),
                  //   // borderRadius: BorderRadius.all(
                  //   //   Radius.circular(30),
                  //   // )
                  //   borderRadius: BorderRadius.circular(
                  //     60,
                  //   ), // same output as .all
                  focusedBorder:
                      border, // jo cheez upar hai usko final variable bana ke yaha likh diya to reduce complexity of code
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, // Allows decimal input
                ),
              ),
            ),

            // Convert button
            Padding(
              padding: const EdgeInsets.all(10), // Space around the button
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Convert input text to double and perform conversion
                    result = double.parse(textEditingController.text) * 87.09;
                    result =
                        double.parse(result.toStringAsFixed(2)); // Round to 2 decimal places
                  });

                  // debugPrint('Hello Guys');
                  // if (kDebugMode) {
                  //   // three types of modes : debug , release , profile
                  //   print('Hello Guys');
                  // }
                  return;
                },
                style: ElevatedButton.styleFrom(
                  elevation: 15, // Button shadow effect
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded button corners
                  ),
                ),
                child: const Text('Convert'), // Button label
              ),
            ),
          ],
        ),
      ),
    );
  }
}
