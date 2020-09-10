import UIKit

var str = "Hello, playground" //оставлю для теста

//3х^2-14x-5 = 0
//уравнение для первого таска

print(" task 1")

let d: Double = (-14)*(-14) - (-4*3*5)

let x1 = (14 + sqrt(d)) / (3*2)

var x2 = (14 - sqrt(d)) / (3*2)

x2 = round(x2*100)/100 //округление до 2х

print(" x1: ",x1,"\n x2: ",x2, "\n") //почему перенос строки с пробелом?

print(" task 2")
let a: Double = 6
let b: Double = 13

let s = a*b/2
var c = sqrt(a*a + b*b)
c = round(c*100)/100
var p = a+b+c
p = round(p*100)/100

print(" s = ", s,"\n c = ", c,"\n p = ", p, "\n")

print(" task 3")

var sum: Double = 100000
let persent = 6.5

for _ in 1...5 {
    sum = sum*(1+persent/100)
}

sum = round(sum*100)/100
print(" sum = ", sum)
