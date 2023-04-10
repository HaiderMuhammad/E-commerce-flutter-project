import 'package:form_field_validator/form_field_validator.dart';



class Validators {
  static final userName = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MaxLengthValidator(150, errorText: "Max length is 150"),
    MinLengthValidator(2, errorText: "Name is too short!")
  ]);

  static final email = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    EmailValidator(errorText: "Provide valid email.")
  ]);

  static final phoneNumber = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
  ]);

  static final password = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MinLengthValidator(8, errorText: "Required 6 digitalis at least.")
  ]);

  static final address = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MinLengthValidator(3, errorText: "Address is too short!"),
  ]);

  static final count = MultiValidator([
    RequiredValidator(errorText: "required!"),
    MinLengthValidator(1, errorText: 'Required 1 digital')
  ]);
}