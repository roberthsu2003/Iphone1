//範圍運算子

for index in 1...5{
	print(index)
}

for index in 1..<5{
	print(index)
}
print("===========")
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
	print(name)
}
print("===========")

for name in names[2...]{
	print(name)
}
print("===========")

for name in names[...2]{
	print(name)
}

print("============")
