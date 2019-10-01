import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstCourse extends StatefulWidget {
  @override
  _HelloInput createState() => _HelloInput();
}

class _HelloInput extends State<FirstCourse> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _currencies = ['Dollars', 'Euro', 'Pounds'];
  final double _formPadding = 5.0;
  String _currency = 'Dollars';
  String result = '';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void _onDropDownChanged(String value) {
    setState(() => _currency = value);
  }

  void _onSubmitCalculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ${_totalCost.toStringAsFixed(2)} $_currency';

    setState(() => result = _result);
  }

  void _onResetCalculate() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() => result = '');
  }

  DropdownButton _dropdownMenu() {
    return DropdownButton<String>(
      value: _currency,
      items: _currencies
          .map(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      onChanged: _onDropDownChanged,
    );
  }

  TextField _textFieldDistance(
    BuildContext context, {
    String labelText,
    String hintText,
    @required controller,
  }) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: textStyle,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  RaisedButton _buttonEvent({Color color, onPressed, @required String text}) {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      color: color,
      textColor: Colors.white,
      child: Text(
        text,
        textScaleFactor: 1.5,
      ),
      onPressed: onPressed,
    );
  }

  Container _resultForm() {
    return Container(
      margin: EdgeInsets.only(top: _formPadding * 2),
      child: Center(
        child: Text(
          result,
          style: TextStyle(
            fontSize: 18,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }

  Column _columnHello(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: _formPadding,
            top: _formPadding,
          ),
          child: _textFieldDistance(
            context,
            controller: distanceController,
            hintText: 'e.g. 124',
            labelText: 'Distance',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: _formPadding,
            top: _formPadding,
          ),
          child: _textFieldDistance(
            context,
            controller: avgController,
            hintText: 'e.g. 17',
            labelText: 'Distance per Unit',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: _formPadding,
            top: _formPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: _textFieldDistance(
                  context,
                  controller: priceController,
                  hintText: 'e.g. 1.65',
                  labelText: 'Price',
                ),
              ),
              Container(
                width: _formPadding * 5,
              ),
              Expanded(
                child: _dropdownMenu(),
              ),
            ],
          ),
        ),
        Container(
          height: _formPadding,
        ),
        Row(
          children: [
            Expanded(
              child: _buttonEvent(text: 'Calculate', color: Colors.green, onPressed: _onSubmitCalculate),
            ),
            Container(
              width: _formPadding * 5,
            ),
            Expanded(
              child: _buttonEvent(text: 'Reset', color: Colors.deepOrange, onPressed: _onResetCalculate),
            ),
          ],
        ),
        _resultForm(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(8),
        child: _columnHello(context),
      ),
    );
  }
}
