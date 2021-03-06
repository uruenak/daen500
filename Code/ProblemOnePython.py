def find_divisible_seven_not_multiple_of_five(my_list):
    filtered_list= []
    for num in my_list:
        if 2000 < num <= 3200:
            if (num % 7 == 0) and (num % 5 != 0):
                filtered_list.append(num)
    return filtered_list
            
        
if __name__ == '__main__':
    user_input = input()
    list = []
    if user_input == 'All':
        list = range(2000,32001)
    else:
        list_str = user_input.strip().split()
        for num in list_str:
            if num.isnumeric():
                list.append(int(num))
            else:
                print('{} is not a valid number. Skipping \n'.format(num))
    final_list = find_divisible_seven_not_multiple_of_five(list)
    print("The numbers divisible by 7, but not a multiple of 5 between 2000 and 3200(inclusive) are : \n",final_list)

