import Foundation


// Задание 1. Функция для определения четности числа
func even (a: Int) -> Bool {
    
    if a%2 == 0 {
        return true
        }
        else
        {
        return false
        }
        
}

print("Task 1: \(even(a: 4))")

// Задание 2. Функция, проверяющая, делится ли число на 3 без остатка

func divideForThree (a: Int) -> Bool {
    
    if a%3 == 0 {
      return true
      }
      else
      {
      return false
      }
    
}

print("Task 2: \(divideForThree(a: 9))")

// Задание 3. Функция, создающая возврастающий массив из 100 чисел.

func array(count: Int) -> Array<Int> {
    
    var newArray = [Int]()
    var i = 0
    for _ in 0...count {
        newArray.append(i)
        i = i+1
    }
    
    return newArray
}

var newArray = array(count: 99)
print("Array of 100 numbers: \(newArray)")

// Из интереса попробовал написать функцию, но в свифте есть более простой способ: var Array = Array(0...99)

// Задание 4. Удаляем из этого массива все четные числа и все числа, которые не делятся на 3.


newArray.removeAll() { value -> Bool
                        in even(a: value) == true || divideForThree(a: value) == true
                     }

print("Same array without %2 and %3: \(newArray)")

//Задание 5. Функция, которая добавляет в массив числа Фиббоначи, 50 элементов

func fibbonaci() -> Array<Int> {

    var fibArray = [Int]()
    
    fibArray.insert(0, at: 0)
    fibArray.insert(1, at: 1)
    
    var number: Int
  
    for i in 2..<50 {
            number = fibArray[i-2] + fibArray[i-1]
            fibArray.append(number)

    }
    return fibArray

}

let fibArray = fibbonaci()
print("Fibonacci array with \(fibArray.count) numbers: \n \(fibArray)")

//Задание 6. Выводим простые числа в диапазоне от 1 до 100

var primeArray = Array(2...100)
var primeArray2 = [Int]()
var p: Int

while primeArray != nil && primeArray.count > 0 {
    p = primeArray[0]
    primeArray2.append(p)
    primeArray = primeArray.filter{$0 % p != 0}
}

print("Prime number array from 2 to 100: \n \(primeArray2)")
