import "package:flutter/cupertino.dart";

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
  double result = 0;

  // Controller for the input text field to capture user input
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 87.09;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: Color.fromARGB(255, 0, 0, 0), // Unused, but could set background color to black
      backgroundColor: CupertinoColors.systemGrey3, // Set the background color of the screen

      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Currency Converter',
          style: const TextStyle(
            fontWeight: FontWeight.w500, // Semi-bold font weight
            fontSize: 20, // Font size of the title
            color: CupertinoColors.white, // Title color set to white
          ),
        ),
        backgroundColor: CupertinoColors.systemGrey3, // AppBar color matches the background
        automaticallyImplyMiddle: true, // Centers the title in the AppBar
      ),


      // Main UI content centered on the screen
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10), // Adds padding around the entire body content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers elements vertically in the Column
            children: [
              // Displays the converted currency result
              Container(
                padding: const EdgeInsets.all(10.0), // Padding inside the container
                margin: const EdgeInsets.all(10.0), // Margin outside the container
                color: CupertinoColors.systemGrey3, // Background color of the container
                child: Text(
                  // Shows the converted INR value
                  'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 45, // Text size of the converted amount
                    fontWeight: FontWeight.w700, // Bold text for emphasis
                    color: CupertinoColors.white, // Text color set to white
                  ),
                ),
              ),

              // Input field where the user can type the USD value
              CupertinoTextField(
                controller: textEditingController, // Associates this field with the textEditingController
                style: const TextStyle(color: CupertinoColors.black), // Text color set to black
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),

                ),
                placeholder: "Please Enter Amount in USD",
                prefix: Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, // Allows decimal input for the USD value
                ),
              ),
              const SizedBox(height: 10), // Adds space between input field and button

              // Convert button that triggers the conversion
              CupertinoButton(
                onPressed: convert, // When the button is pressed, it calls the convert() method
                color: CupertinoColors.black,
                child: const Text('Convert'), // Label on the button
              ),
            ],
          ),
        ),
      ),
    );
  }
}