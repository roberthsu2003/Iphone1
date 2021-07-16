import UIKit

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeds:Int)
    case outOfStock
}



func canThrowError(num:Int) throws -> String{
    if num == 10{
        throw VendingMachineError.insufficientFunds(coinsNeeds: 5)
    }
    
    return "有傳出字串"
}

//執行有丟出錯誤的方法有4種
//do..try..catch
//try?
//try!
//throw

if let stringValue = try? canThrowError(num: 10){
    print(stringValue)
}else{
    print("method 出錯")
}

let stringValue1 = try! canThrowError(num: 5)
print(stringValue1)

do{
    let stringValue = try canThrowError(num: 10)
    print(stringValue)
}catch VendingMachineError.insufficientFunds(let coinsNeeds){
    print("出錯了,少了\(coinsNeeds)")
}catch VendingMachineError.invalidSelection{
    print("不合法的選擇")
}catch{
    print("有其它錯誤")
}

