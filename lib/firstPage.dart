import 'package:flutter/material.dart';

class ConverUnit extends StatefulWidget {
  const ConverUnit({super.key});

  @override
  State<ConverUnit> createState() => _ConverUnitState();
}

class _ConverUnitState extends State<ConverUnit> {
  var userInput = TextEditingController();
  var outPut = "";
  var meter;
  var clear = "";
  String dropdownvalue = 'm';
  var listitems = ['km', 'm', 'mm', "Nano.m"];

  centiTometer(String? value) {
    double? cm = double.tryParse(userInput.text);
    if (cm == null) {
      setState(() {
        outPut = 'Value is empty.';
      });
    } else {
      if (value == "m") {
        meter = (cm / 100).toStringAsFixed(2);
      } else if (value == "mm") {
        meter = (cm * 10).toStringAsFixed(2);
      } else if (value == "Nano.m") {
        meter = (cm * 10000000).toStringAsFixed(2);
      } else if (value == 'km') {
        meter = (cm / 100000).toStringAsFixed(2);
      }

      setState(() {
        outPut = meter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "output in ${dropdownvalue} is ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    outPut,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
            indent: 200,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: userInput,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Enter the value in cm.",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      userInput.text = clear;
                      outPut = "";
                    });
                  },
                  child: const Text(
                    " Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              DropdownButton(
                onTap: () {},
                focusColor: Colors.black,
                dropdownColor: Colors.black,
                padding: EdgeInsets.all(20),
                value: dropdownvalue,
                style: TextStyle(color: Colors.white),

                // Down Arrow Icon
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),

                // Array list of items
                items: listitems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    centiTometer(newValue);
                  });
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
