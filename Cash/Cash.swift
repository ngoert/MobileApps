/*
 algorithm that converts cash amounts into a
 minimal number of bills and coins.
 https://stackoverflow.com/questions/42357571/product-purchase-and-money-change-based-on-money-bills-the-user-has
 
 Nicholas Goertemiller
 Dr. MayField CS 4153
 DUE: 01/27/2022
 Program to convert cash amount into a minimal amount of bills and coins
 

 */







public class Cash{

 struct CoinChangeProblem {
    let money: [Double]
     //backing variable
     init(denominations: [Double]) {
        self.money = denominations
    }

     
     //computed property--> minimum number of bills
     //value ---> constant property
     func Bills(for value: Double) -> [Int]? {
        guard value >= 0
        else {
            return nil
        }

        var remainder = value
        var result = [Int]()
        for i in money {                    //calculate how many bills, iteration of money
            let count = Int(remainder/i)
            remainder -= Double(count) * i //recalculate value
            result.append(count)        //adding number to result
        }

        return result
    }
   
    func reverse(for value: [Int]) -> Double {   //func to reverse arr of int to a single double var
        var result = Double()
        if value.count < 9 {
            result = -1                         //print -1 if indeces are not 0...8
        }
        else {
            var i: Int = 0
            while i < value.count {             //iteration of arr
                result += (Double(value[i]) * money[i])
                i += 1                          //keep count, +1 after each index
            }
    }
    return result
    }

     
     //denominations of money
    static var dollar = CoinChangeProblem(denominations:
        [50.00, 20.00, 10.00, 5.00, 1.00, 0.25, 0.10, 0.05, 0.01])
}
}





let usCoins = Cash.CoinChangeProblem.dollar
let optimal = usCoins.Bills(for: 12.34)
let optimal1 = usCoins.Bills(for: -12.34)
let optimal2 = usCoins.Bills(for: 0)
let optimal3 = usCoins.Bills(for: 100)
let optimal4 = usCoins.Bills(for: 87.15)
let optimal5 = usCoins.Bills(for: 53.19)
print(optimal as Any)
print(optimal1 as Any)
print(optimal2 as Any)
print(optimal3 as Any)
print(optimal4 as Any)
print(optimal5 as Any)



print("\n")

let bills = Cash.CoinChangeProblem.dollar
let test = bills.reverse(for: [0,0,1,1,2,0,0,5,1])
let test1 = bills.reverse(for: [0,0,1,1,2,0])
let test2 = bills.reverse(for: [4,1,1,2,0,0,0,0,0])
let test3 = bills.reverse(for: [0,5,1,1,3,0,8,9,5])
let test4 = bills.reverse(for: [2,0,0,0,0,0,0,0,0])
let test5 = bills.reverse(for: [5,0,1,1,2,0,0,5,1])
print(test)
print(test1)
print(test2)
print(test3)
print(test4)
print(test5)
