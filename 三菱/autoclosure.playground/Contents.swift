var customersInLines = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

print(customersInLines.count)

let customerProvider = {
    customersInLines.remove(at:0)
}

print(customersInLines.count)

print("Now serving \(customerProvider())")
print(customersInLines.count)

func serve(customer customerProvider:@autoclosure ()->String){
    print("Now serving\(customerProvider())!")
}

serve(customer: customersInLines.remove(at:0))
