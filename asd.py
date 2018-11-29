with open("asd.txt", "w+", encoding="utf-8") as skra:
    mem_num = input("mem_num: ")
    mem_fname = input("mem_fname: ")
    mem_lname = input("mem_lname: ")
    mem_street = input("mem_street: ")
    mem_city = input("mem_city: ")
    mem_state = input("mem_state: ")
    mem_zip = input("mem_zip: ")
    mem_balance = input("mem_balance: ")
    asd = "("+ mem_num + ", '"+ mem_fname +"', '"+ mem_lname +"', '"+ mem_street +"', '"+ mem_city +"', '"+ mem_state +"', "+ mem_zip +", "+ mem_balance + "),\n"
    skra.write(asd)
    print(str(mem_num + ", '"+ mem_fname +"', '"+ mem_lname +"', '"+ mem_street +"', '"+ mem_city +"', '"+ mem_state +"', "+ mem_zip +", "+ mem_balance))
