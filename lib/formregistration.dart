import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class formRegistration extends StatefulWidget {
  const formRegistration({super.key});

  @override
  State<formRegistration> createState() => _formRegistrationState();
}

class _formRegistrationState extends State<formRegistration> {
  late Color myColor;
  late Size medSize;
  final _formkey =GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    medSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(image: AssetImage('assets/images/jeremy-bishop-8xznAGy4HcY-unsplashlow.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(myColor.withOpacity(0.5), BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          key: _formkey,
          children: [
          Positioned(top:65, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom())
          ]),
      ),
    );
  }

  Widget _buildTop(){
    return SizedBox(
      width: medSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.waving_hand_outlined,
            size: 90,
            color: Colors.white,
          ),
          SizedBox(height: 20,),
          Text("Hello There!, Welcome to Registration Form",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: medSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildForm(),
          ),
      ),
    );
  }

  Widget _buildForm(){
    return Form(
      key: _formkey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Regist Here",
        style: TextStyle(
          color: myColor,
          fontSize: 32,
          fontWeight: FontWeight.w500
        ),
        ),
        _customText("Please filled all the required field."),
         SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Your Username",
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                  )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Your Email",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                  )
              ),
              validator: (value) {
                if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                  return 'Invalid Email';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            IntlPhoneField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Your Phone Number",
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                  ),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _date,
              decoration: InputDecoration(
                hintText: "Your Birthday",
                labelText: "Birtday",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                  ),
              ),
              onTap: () async{
                DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2101));
                
                if (pickeddate != null) {
                  setState(() {
                    _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                  });
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Birthday is required";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                elevation: 5,
                shadowColor: myColor,
                minimumSize: Size.fromHeight(50)
              ),
              onPressed: (){
              if (_formkey.currentState!.validate()) {
                print("Data is Valid");
              }
            }, child: Text('Submit'))
      ],), 
    );
  }

  Widget _customText(String text){
    return Text(
      text,
      style: const TextStyle(color: Colors.grey,fontSize: 13),
    );
  }
}