x = int(input("Enter the first number: "))
y = int(input("Enter the second number: "))
print('For adding, select 1'+'\n'+'For subtracting, select 2'+'\n'+'For multiplying, select 3'+'\n'+'For division, select 4')
o = input("Select the operation number: ")
class calc():
    def add(x,y):
        a = x+y;
        print('result = ',a)
    def sub(x,y):
        s = x-y;
        print('result = ',s)
    def mul(x,y):
        m = x*y;
        print('result = ',m)
    def div(x,y):
        d = x/y;
        print('result = ',d)
if o == '1':
    r = calc.add(x,y)
elif o == '2':
    r = calc.sub(x,y)
elif o == '3':
    r = calc.mul(x,y)
elif o == '4':
    r = calc.div(x,y)
# print('To continue, select 1' + '\n' 'To end, select 2')
# o1 = input('Select 1 or 2: ')
# if o1 == '1':
#     z = input('Enter the number: ')
#     o2 = input('Select the operation number: ')
#     if o == '1':
#         calc.add(r,z)
#     elif o == '2':
#         calc.sub(r,z)
#     elif o == '3':
#         calc.mul(r,z)
#     elif o == '4':
#         calc.div(r,z)
# elif o1 == '2':
#     print('Done!')
