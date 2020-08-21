import UIKit

// let's begin to study swift
// hello world
var str = "hello world"
print(str)

// data type
// int
var int = 10
// float
var float = 15.5
// double
var double = 25.5
// boolean
var boolean = true
// string
var string = "Hello"
// character
var character = "A"

print(int)
print(float)
print(double)
print(boolean)
print(string)
print(character)

// optionals type
var optionalInt: Int?
var optionalDouble: Optional<Double>

// 普通输出
print(optionalInt)

// 附带强制解析输出，使用‘!’可以强制解析可选类型，但当可选类型的值为nil时，会发生运行时异常
optionalInt = 55
if optionalInt != nil {
    print(optionalInt!)
}

// 常量，使用let关键字定义
let name = "Jeffrey"
// 类型标注常量
let age: String = "28"
print("My name is \(name), age \(age)")

// 算数运算符
var a = 50.0
var b = 30.0

print("a + b = \(a + b)")
print("a - b = \(a - b)")
print("a * b = \(a * b)")
print("a / b = \(a / b)")

// a++ & b-- 还可以使用“-=, *=, /=”
a += 1
print("a value is \(a)")
b -= 1
print("b value is \(b)")

// 比较运算符
print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a > b : \(a > b)")
print("a < b : \(a < b)")
print("a >= b : \(a >= b)")
print("a <= b : \(a <= b)")

// 逻辑运算符
var c = true
var d = false

print("c && d = \(c && d)")
print("c || d = \(c || d)")
print("!c = \(!c)")
print("!d = \(!d)")

// if - else
var e = 10
if(e == 10){
    print("e = 10")
}else{
    print("e != 10")
}
e == 15 ? print("e = 15") : print("e != 15")

// array,
var array1 = [Int](repeating: 0, count: 5)
