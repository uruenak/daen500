class MyFinalClass:
    def __init__(self, name):
        self.name = name
        
    def getString(self):
        print('Please enter a string: ')
        user_input = input()
        return user_input
        
    def printString(self, stringToPrint):
        print('Your string in upper case is: {}'.format(stringToPrint.upper()))
                
if __name__ == '__main__':
    print('Welcome to MyClass')
    my_class = MyFinalClass("thisClass")
    input_from_user = my_class.getString()
    my_class.printString(input_from_user)
    


