import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late double screenHeight, screenWidth, resWidth;
  bool _passwordVisible = true;

  final focus = FocusNode();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();
  final focus6 = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/registration.png'),
                      fit: BoxFit.cover))),
          Form(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                          child: Column(
                            children: <Widget>[
                              const Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (val) =>
                                    val!.isEmpty || (val.length < 3)
                                        ? "name must be longer than 3"
                                        : null,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus);
                                },
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    labelText: 'Name',
                                    labelStyle: TextStyle(),
                                    icon: Icon(Icons.account_box),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid phone number';
                                  }
                                  bool phoneNoValid = RegExp(
                                          r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                      .hasMatch(value);

                                  if (!phoneNoValid) {
                                    return 'Please enter a phone number';
                                  }
                                  return null;
                                },
                                focusNode: focus1,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus2);
                                },
                                controller: _phonenoController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(),
                                    icon: Icon(Icons.local_phone),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (val) =>
                                    val!.isEmpty || (val.length < 10)
                                        ? "Please enter a valid address"
                                        : null,
                                focusNode: focus2,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus3);
                                },
                                controller: _addressController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: 'Home Address',
                                    labelStyle: TextStyle(),
                                    icon: Icon(Icons.location_city),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 235, 231, 231)),
                                    color: const Color.fromARGB(
                                        255, 235, 231, 231),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        validator: (val) => val!.isEmpty ||
                                                !val.contains("@") ||
                                                !val.contains(".")
                                            ? "enter a valid email"
                                            : null,
                                        focusNode: focus3,
                                        onFieldSubmitted: (v) {
                                          FocusScope.of(context)
                                              .requestFocus(focus4);
                                        },
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: TextStyle(),
                                            icon: Icon(Icons.local_phone),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        textInputAction: TextInputAction.next,
                                        validator: (val) =>
                                            validatePassword(val.toString()),
                                        focusNode: focus4,
                                        onFieldSubmitted: (v) {
                                          FocusScope.of(context)
                                              .requestFocus(focus5);
                                        },
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: const InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(),
                                            icon: Icon(Icons.lock),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.5),
                                            )),
                                        obscureText: _passwordVisible,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        style: const TextStyle(),
                                        textInputAction: TextInputAction.done,
                                        validator: (val) {
                                          validatePassword(val.toString());
                                          if (val != _passwordController.text) {
                                            return "password do not match";
                                          } else {
                                            return null;
                                          }
                                        },
                                        focusNode: focus5,
                                        onFieldSubmitted: (v) {
                                          FocusScope.of(context)
                                              .requestFocus(focus6);
                                        },
                                        controller: _password2Controller,
                                        decoration: const InputDecoration(
                                            labelText: 'Re-enter Password',
                                            labelStyle: TextStyle(),
                                            icon: Icon(Icons.lock),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 2.0),
                                            )),
                                        obscureText: _passwordVisible,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));

    /*return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/registration.png'),
                      fit: BoxFit.cover))),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 10,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              validator: (val) =>
                                  val!.isEmpty || (val.length < 3)
                                      ? "name must be longer than 3"
                                      : null,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus);
                              },
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.account_box),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.5),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid phone number';
                                }
                                bool phoneNoValid = RegExp(
                                        r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                    .hasMatch(value);

                                if (!phoneNoValid) {
                                  return 'Please enter a phone number';
                                }
                                return null;
                              },
                              focusNode: focus1,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus2);
                              },
                              controller: _phonenoController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.local_phone),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.5),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              validator: (val) =>
                                  val!.isEmpty || (val.length < 10)
                                      ? "Please enter a valid address"
                                      : null,
                              focusNode: focus2,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus3);
                              },
                              controller: _addressController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  labelText: 'Home Address',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.location_city),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.5),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 235, 231, 231)),
                                  color:
                                      const Color.fromARGB(255, 235, 231, 231),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (val) => val!.isEmpty ||
                                              !val.contains("@") ||
                                              !val.contains(".")
                                          ? "enter a valid email"
                                          : null,
                                      focusNode: focus3,
                                      onFieldSubmitted: (v) {
                                        FocusScope.of(context)
                                            .requestFocus(focus4);
                                      },
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(),
                                          icon: Icon(Icons.local_phone),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.5),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (val) =>
                                          validatePassword(val.toString()),
                                      focusNode: focus4,
                                      onFieldSubmitted: (v) {
                                        FocusScope.of(context)
                                            .requestFocus(focus5);
                                      },
                                      controller: _passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: TextStyle(),
                                          icon: Icon(Icons.lock),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.5),
                                          )),
                                      obscureText: _passwordVisible,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      style: const TextStyle(),
                                      textInputAction: TextInputAction.done,
                                      validator: (val) {
                                        validatePassword(val.toString());
                                        if (val != _passwordController.text) {
                                          return "password do not match";
                                        } else {
                                          return null;
                                        }
                                      },
                                      focusNode: focus5,
                                      onFieldSubmitted: (v) {
                                        FocusScope.of(context)
                                            .requestFocus(focus6);
                                      },
                                      controller: _password2Controller,
                                      decoration: const InputDecoration(
                                          labelText: 'Re-enter Password',
                                          labelStyle: TextStyle(),
                                          icon: Icon(Icons.lock),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2.0),
                                          )),
                                      obscureText: _passwordVisible,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );*/
  }
}

String? validatePassword(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}
