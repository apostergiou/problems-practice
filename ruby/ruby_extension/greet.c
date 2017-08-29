#include <ruby.h>

VALUE mGreet;
VALUE mPrinter;

static VALUE speak(VALUE self){
  const char *sentence= "Hello world!";
  return rb_str_new2(sentence);
}

void Init_greet(){
  // Define a module Greet
  mGreet = rb_define_module("Greet");

  // Define our Class Printer under the module Greet
  mPrinter = rb_define_class_under(mGreet, "Printer", rb_cObject);

  // Define our singleton method
  rb_define_singleton_method(mPrinter, "speak", speak, 0);
}
