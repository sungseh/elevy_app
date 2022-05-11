import 'package:elevy_app/widgets/app_info_box.dart';
import 'package:elevy_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key, 
    required this.title
  }) : super(key: key); 

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController? _amountController = TextEditingController();
  final _focusAmount = FocusNode();
  double? _amount;
  int value = 0;

  double _counter = 0;

  void _incrementCounter() {
    double? x;
    if(_amount != null){
      x = _amount! * 0.1;
    }
    setState(() { 
      _counter = x!;
    });

    // setState(() { 
    //   _counter++;
    // });
  }

  void _calculate(){
    double? x;
    if(_amount != null){
      x = _amount! * 0.1;
    }
    setState(() { 
      _counter = x!;
    }); 
  }

  _selectNetwork(int index){ 
    setState(() {
      value = index;
    }); 
    print("index value: $value");
  }



  Widget _amountSent(){
    return AppTextFormInput(
      keyboardType: TextInputType.number,
      title: "Amount Sent",
      hintText: "Amount Sent", 
      // errorText: _validBusinessName != null ? _validBusinessName : null,
      focusNode: _focusAmount, 
      textInputAction: TextInputAction.next,
      controller: _amountController, 
      icon: Icon(Icons.clear),  
      validator: (value) { 
        // if(UtilValidatorBool.isValidText(value!, max: 3)){
        //   return 'Please enter a valid business name'; 
        // }
      }, 
      onTapIcon: () async { 
        _amountController?.clear();
      },
      onSubmitted: (text) {
        // UtilOther.fieldFocusChange(
        //   context,
        //   _focusBusinessName,
        //   _focusDateEstablished,
        // );
      }, 
      onChanged: (value) {  
        _amount = double.parse(value);
      },              
    );
  }

  @override
  Widget build(BuildContext context) { 
    double width = MediaQuery.of(context).size.width;
   

    return Scaffold(
      // appBar: AppBar( 
      //   title: Text(widget.title),
      // ),
      body: Center( 
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          child: Form( 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const Text(
                //   'You have pushed the button this many times:',
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppInfoBox(
                      title: "Service charges",
                      amount: _counter,
                      color: Colors.red,
                    ), 
                    SizedBox(
                      width: width * 0.025, 
                    ),
                    AppInfoBox(
                      title: "eLevy charges",
                      amount: _counter, 
                      color: Colors.blue,
                    ),  
                  ],
                ),
                // TextField(
                //   // decoration: InputDecorationTheme(),

                // ), 
                _amountSent(),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppRadioButton(
                      title:  "MTN",
                      color: (value == 1) ? Colors.green : Colors.black,
                      onPressed: () => _selectNetwork(1)
                    ),
                    AppRadioButton(
                      title:  "VodaCash",
                      color: (value == 2) ? Colors.green : Colors.black,
                      onPressed: () => _selectNetwork(2)
                    ),
                    AppRadioButton(
                      title:  "AirtelTigo",
                      color: (value == 3) ? Colors.green : Colors.black,
                      onPressed: () => _selectNetwork(3)
                    )
                  ],
                ),
                const SizedBox(
                  height: 16
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom( 
                    // primary: Colors.black,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  child: const Text(
                    "Calculate"
                  ),
                ), 
              ],
            ),
          ),
        ),

      ), 
    );
  }
}
