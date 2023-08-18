import 'package:flutter/material.dart';

void main() { 

  runApp( MyApp());
}


class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState(); 
                            //return _MyAppState();

}

class _MyAppState extends State<MyApp>{
 final controllar = TextEditingController();

List<bool> _selection = [true,false,false];

  String tip="";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
       Scaffold(
        body: 
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(tip != null)
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            tip,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),

                   

                    Text('Total Amount'),

                    SizedBox(
                      width: 90,
                      child: TextField(
                        controller: controllar,
                        textAlign :TextAlign.center,
                        decoration: InputDecoration(hintText: '\$ 0.00'),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ToggleButtons(
                        children: [Text("10%"),Text("15%"),Text("20%")],
                         isSelected: _selection,
                         onPressed: updateSelection,
                        ),
                    ),

                  //  FloatingActionButton(
                  //    onPressed:calculatorTip,
                  //     child: Text("Calculate Tip"),
                  //     focusColor : Colors.green,
                  //     backgroundColor: Colors.green,
                      
                  //   //  text Colors.white
                  //   ),

ElevatedButton.icon(
  onPressed: calculatorTip,
  icon: Icon( // <-- Icon
    Icons.calculate,
    size: 24.0,
  ),
  label: Text('Calculate Tip'), // <-- Text
),




                  ],
                ),
              ),
        )
    );
  }


 void updateSelection (int selectedIndex){
        setState(() {
          for(int i = 0; i < _selection.length;i++){ 
          _selection[i] =selectedIndex == i;
        }
        });
 }
 
 
 void calculatorTip(){
      final totalAmount = double.parse(controllar.text);
      final selectedIndex = _selection.indexWhere((element) => element);
      final tipPercentage =[0.1, 0.15, 0.2][selectedIndex];
      
      final tipTotal = (totalAmount*tipPercentage).toStringAsFixed(2);

      setState(() {
        tip = '\$$tipTotal';
      });
 }
 
}





