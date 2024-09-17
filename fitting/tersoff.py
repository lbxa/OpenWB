import math 

D0 = 5.41861
S = 1.92708
beta = 1.38528
r0 = 2.34095

l1 = beta * math.sqrt(2*S)
A = D0/(S-1) * math.exp(l1*r0)

l2 = beta * math.sqrt(2/S)
B = S*D0/(S - 1) * math.exp(l2*r0)

print("l1 = " + str(l1))
print("l2 = " + str(l2))

print("A = " + str(A))
print("B = " + str(B))