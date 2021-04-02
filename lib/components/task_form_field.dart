import 'package:flutter/material.dart';

class TaskFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

    bool validate() {
      final form = globalFormKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Form(
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Adcionar Nova Tarefa',
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).disabledColor,
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
