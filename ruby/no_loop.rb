# Print a String 1000 times.
# Rules:
# 1) no loops
# 2) no recursion
# 3) don't write it by hand
def print_1000; print_300 + print_300 + print_300 + print_100 end
def print_300; print_100 + print_100 + print_100 end
def print_100; print_30 + print_30 + print_30 + print_10 end
def print_30; print_10 + print_10 + print_10 end
def print_10; print_3 + print_3 + print_3 + print_1 end
def print_3; print_1 + print_1 + print_1 end
def print_1; "hello\n" end

puts print_1000
