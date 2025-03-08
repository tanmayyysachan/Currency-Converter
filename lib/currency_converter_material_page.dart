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

  void convert() {
    result = double.parse(textEditingController.text) * 87.09;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Defines a common border style used in the input field
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 3.0),
      borderRadius: const BorderRadius.all(Radius.circular(0)),
    );

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 0, 0, 0), // Unused, but could set background color to black
      backgroundColor:
          Colors.blueGrey, // Set the background color of the screen

      appBar: AppBar(
        title: const Text('Currency Converter'), // Title of the app
        backgroundColor: Colors.blueGrey, // AppBar color matches the background
        elevation: 50, // Adds a depth effect (shadow) to the AppBar
        centerTitle: true, // Centers the title in the AppBar
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500, // Semi-bold font weight
          fontSize: 20, // Font size of the title
          color: Colors.white, // Title color set to white
        ),
      ),

      // Main UI content centered on the screen
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            10,
          ), // Adds padding around the entire body content
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center, // Centers elements vertically in the Column
            children: [
              // Displays the converted currency result
              Container(
                padding: const EdgeInsets.all(
                  10.0,
                ), // Padding inside the container
                margin: const EdgeInsets.all(
                  10.0,
                ), // Margin outside the container
                color: Colors.blueGrey, // Background color of the container
                child: Text(
                  // Shows the converted INR value
                  'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 45, // Text size of the converted amount
                    fontWeight: FontWeight.w700, // Bold text for emphasis
                    color: Colors.white, // Text color set to white
                  ),
                ),
              ),

              // Input field where the user can type the USD value
              TextField(
                controller:
                    textEditingController, // Associates this field with the textEditingController
                style: const TextStyle(
                  color: Colors.black,
                ), // Text color set to black
                decoration: InputDecoration(
                  // label: Text(
                  //   'Please Enter Value in INR',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  hintText: "Please Enter Value in USD", // Placeholder text
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ), // Hint text style
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined, // Icon for the input field
                  ),
                  prefixIconColor: Colors.black, // Icon color set to black
                  filled:
                      true, // Enables background color inside the input field
                  fillColor:
                      Colors
                          .white, // Set background color of the text field to white
                  focusedBorder:
                      border, // Use the defined border style when the field is focused
                  enabledBorder:
                      border, // Use the same border style when the field is enabled
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, // Allows decimal input for the USD value
                ),
              ),
              const SizedBox(
                height: 10,
              ), // Adds space between input field and button
              // Convert button that triggers the conversion
              ElevatedButton(
                onPressed:
                    convert, // When the button is pressed, it calls the convert() method
                // debugPrint('Hello Guys');
                // if (kDebugMode) {
                //   // three types of modes : debug , release , profile
                //   print('Hello Guys');
                // }
                style: ElevatedButton.styleFrom(
                  elevation: 15, // Adds shadow to the button
                  backgroundColor:
                      Colors.black, // Set button background color to black
                  foregroundColor:
                      Colors.white, // Set text color on button to white
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ), // Make button full-width with minimum height 50
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Rounded corners for the button
                  ),
                ),
                child: const Text('Convert'), // Label on the button
              ),
            ],
          ),
        ),
      ),
    );
  }
}
