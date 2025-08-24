import 'package:flutter/material.dart';

class DesignText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool boldText;
  final double textSize;
  final double textSpace;
  const DesignText(
      {this.textColor = Colors.black,
      this.boldText = false,
      this.textSize = 18,
      this.textSpace = 0,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
          fontSize: textSize,
          letterSpacing: textSpace),
    );
  }
}

class DesignTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double verticalSize;
  final double horizontalSize;
  const DesignTextField(
      {this.horizontalSize = 12.0,
      this.verticalSize = 12.0,
      required this.hintText,
      required this.textController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalSize, horizontal: horizontalSize),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}

class DesignButton extends StatelessWidget {
  final void Function()? buttonFunction;
  final String buttonText;
  const DesignButton(
      {required this.buttonText, required this.buttonFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DesignText(
          text: buttonText,
          boldText: true,
          textSize: 20,
        ),
      ),
    );
  }
}

class DialogDesign extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? buttonFunction;
  const DialogDesign(
      {required this.title,
      required this.subTitle,
      required this.buttonFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.shade500,
               offset: Offset(4, 4),blurRadius: 4,spreadRadius: 2),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2, -2),
                blurRadius: 4,spreadRadius: 2
              )
            ],
              borderRadius: BorderRadius.circular(12), color: Colors.grey),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              DesignText(
                text: title,
                boldText: true,
                textSize: 24,
              ),
              SizedBox(
                height: 10,
              ),
              DesignText(text: subTitle),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DesignButton(
                        buttonText: " Okay ", buttonFunction: buttonFunction),
                    DesignButton(
                        buttonText: "Cancel",
                        buttonFunction: () => Navigator.pop(context))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
