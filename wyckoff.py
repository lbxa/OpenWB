from typing import Callable

"""
Wyckoff positions to LAMMPS format
"""

def coords(a, b, c, x, y, z, wyckoff: Callable[[int, int, int], None], id=1, offset=1):
  precision = 4
  positions = set()

  for coords in wyckoff(x, y, z):
    x, y, z = coords

    if x < 0:
      x += 1
    if y < 0:
      y += 1
    if z < 0:
      z += 1

    x *= a
    y *= b
    z *= c
    positions.add((round(x, precision), round(y, precision), round(z, precision)))

  for i, pos in enumerate(positions, offset):
    x, y, z = pos
    print(f"{i} {id} {x} {y} {z}")

a=2.982
b=2.982
c=13.87

g_4f = lambda x, y, z: [(1/3,2/3,z), (2/3,1/3,z+0.5), (2/3,1/3,-z), (1/3,2/3,-z+0.5)]

coords(
  a, b, c, 
  x=1/3, 
  y=2/3, 
  z=0.139000, 
  wyckoff=g_4f,
  id=1
)

site_symmetry_group = lambda x, y, z: [
  (x, y, z),
  (-y, x-y, z),
  (-x+y, -x, z),
  (-y, -x, -z+0.5),
  (-x+y, y, -z+0.5),
  (x, x-y, -z+0.5),
  (x, y, -z+0.5),
  (-y, x-y, -z+0.5),
  (-x+y, -x, -z+0.5),
  (-y, -x, z),
  (-x+y, y, z),
  (x, x-y, z)
]

g_2b = lambda x, y, z: [(0,0,1/4), (0,0,3/4), *site_symmetry_group(x, y, z)]

coords(
  a, b, c, 
  x=0.0, 
  y=0.0, 
  z=1/4, 
  wyckoff=g_2b,
  id=2,
  offset=5
)

g_2d = lambda x, y, z: [(1/3,2/3,3/4), (2/3,1/3,1/4)]
	
coords(
  a, b, c, 
  x=1/3, 
  y=2/3, 
  z=3/4, 
  wyckoff=g_2b,
  id=2,
  offset=7
)

g_3m_local_symmetry = lambda x, y, z: [
  (x, y, z),
  (-y+1, x-y+1, z),
  (-x+y, -x+1, z),
  (-y+1, -x+1, z),
  (-x+y, y, z),
  (x, x-y+1, z)
]

coords(
  a, b, c, 
  x=1/3, 
  y=2/3, 
  z=-0.028, 
  wyckoff=lambda x, y, z: [*g_4f(x, y, z), *g_3m_local_symmetry(x, y , z)],
  id=2,
  offset=9
)