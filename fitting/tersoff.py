import math 

D0 = 6.64
S = 2.96149
beta = 1.80370
r0 = 1.90547

l1 = beta * math.sqrt(2*S)
A = D0/(S-1) * math.exp(l1 * r0)

l2 = beta * math.sqrt(2/S)
B = S*D0/(S - 1) * math.exp(l2 * r0)

print("l1 = " + str(l1))
print("l2 = " + str(l2))

print("A = " + str(A))
print("B = " + str(B))