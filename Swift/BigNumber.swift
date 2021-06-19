//
//  BigNumber.swift
//  ProjectEulerSwift
//
//  Created by Furkan Erturk on 16/06/2021.
//  Copyright © 2021 Nuh Furkan Erturk. All rights reserved.
//

import Foundation

class BigNumber {
    var myNumber: [Int] = []
    
    init(newNumber: String) {
        for x in newNumber {
            if let num: Int = x.wholeNumberValue {
                myNumber.append(num)
            } else {
                print("something happened!")
            }
        }
    }
    
    init(newNumber: Int) {
        let nm = String(newNumber)
        for x in nm {
            if let num: Int = x.wholeNumberValue {
                myNumber.append(num)
            } else {
                print("something happened!")
            }
        }
    }
    
    func pow(pow: Int) -> BigNumber {
        let res = self
        let half = pow/2
        
        if pow == 1 {
            return res
        }
        
        return res.pow(pow: pow-half) * res.pow(pow: half)
    }
    
    static func * (left: BigNumber, right: BigNumber) -> BigNumber {
        let lft:String = String(left.toString().reversed())
        let rgt:String = String(right.toString().reversed())
        var cnt = 0
        var temp: String = ""
        var bigNumbers: [BigNumber] = []
        
        
        for nr1 in lft {
            var carry = 0
            let nr1Digit: Int = nr1.wholeNumberValue ?? 1
            var smn = 0
            while smn < cnt {
                temp.append("0")
                smn += 1
            }
            for l in rgt {
                let nr2Digit: Int = l.wholeNumberValue ?? 1
                let number = nr1Digit * nr2Digit + carry
                temp.append(String(number%10))
                carry = number/10
            }
            if (carry != 0) {
                temp.append(String(carry))
            }
            
            //print("nr1_\(nr1) * \(rgt) = \(String(temp.reversed()))")
            cnt += 1
            bigNumbers.append(BigNumber(newNumber: String(temp.reversed())))
            temp = ""
        }
        var finNumber = BigNumber(newNumber: "0")
        for bgnm in bigNumbers {
            finNumber = finNumber + bgnm
        }
        
        return finNumber
    }
    
    static func + (left: BigNumber, right: BigNumber) -> BigNumber {
        var newNumber: [Int] = []
        let smallNr: Int
        let bigNr: Int
        var carry: Int = 0
        if left.myNumber.count < right.myNumber.count {
            smallNr = left.myNumber.count
            bigNr = right.myNumber.count
            for x in 1...left.myNumber.count {
                let temp = right.myNumber[right.myNumber.count-x] + left.myNumber[left.myNumber.count-x]+carry
                newNumber.insert((temp%10), at: 0)
                carry = temp/10
            }
            if smallNr != bigNr {
                for m in smallNr+1...bigNr {
                    let temp = right.myNumber[right.myNumber.count-m]+carry
                    newNumber.insert((temp%10), at: 0)
                    carry = temp/10
                }
            }
            
            
            // 99
            // 9999
        } else {
            smallNr = right.myNumber.count
            bigNr = left.myNumber.count
            for x in 1...right.myNumber.count {
                let temp = right.myNumber[right.myNumber.count-x] + left.myNumber[left.myNumber.count-x]+carry
                newNumber.insert((temp%10), at: 0)
                carry = temp/10
            }
            if smallNr != bigNr {
                for m in smallNr+1...bigNr {
                    let temp = left.myNumber[left.myNumber.count-m]+carry
                    newNumber.insert((temp%10), at: 0)
                    carry = temp/10
                }
            }
        }
        if carry != 0 {
            //print("carry = \(carry)")
            newNumber.insert(carry, at: 0)
        }
        var num: String = ""
        for x in newNumber {
            num.append(String(x))
        }
        return BigNumber(newNumber: num)
    }
    
    func toString() -> String {
        var num: String = ""
        for x in myNumber {
            num.append(String(x))
        }
        return num
    }
}
