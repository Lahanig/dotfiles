import os

print("You really wont to shutdown pc (Y/n)")
flag = input()

if flag == "y" or flag == "Y" or flag == "н" or flag == "Н":
    os.system("shutdown 0")
