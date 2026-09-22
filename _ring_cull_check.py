import math, random
RW, RH = 720.0, 1280.0

def inner_of(radius, width):
    return min(max(radius - width, 0.0), radius)

def pred_cull(x, y, radius, width):
    """the GML predicate: True = no visible part in the room -> destroy"""
    inner = inner_of(radius, width)
    near  = math.hypot(x - min(max(x, 0.0), RW), y - min(max(y, 0.0), RH))
    far   = max(math.hypot(x - cx, y - cy) for cx in (0.0, RW) for cy in (0.0, RH))
    return (near > radius) or (far < inner)

def brute_cull(x, y, radius, width):
    """reference: is any room pixel centre inside the annulus?"""
    inner = inner_of(radius, width)
    for py in range(int(RH)):
        for px in range(int(RW)):
            d = math.hypot(px + .5 - x, py + .5 - y)
            if inner <= d <= radius:
                return False
    return True

cases = [
    ("ring at (520,520) r300 w60 — partly visible", 520, 520, 300, 60),
    ("ring at (-500,-500) r300 — fully outside",   -500, -500, 300, 60),
    ("ring at (1500,300) r300 — fully outside",    1500, 300, 300, 60),
    ("room entirely inside the hole",               360, 640, 1200, 200),
    ("hole just smaller than the corner distance",  360, 640, 760, 30),
    ("ring straddling the left edge",              -280, 640, 300, 60),
    ("degenerate width>=radius (solid disc)",       100, 100, 400, 900),
    ("zero width (nothing drawn)",                  360, 640, 300, 0),
    ("radius 0",                                    360, 640, 0, 0),
]
print("%-44s %-8s %-8s %s" % ("case", "GML", "brute", "match"))
bad = 0
for (name, x, y, r, w) in cases:
    a = pred_cull(x, y, r, w); b = brute_cull(x, y, r, w)
    ok = (a == b)
    if not ok: bad += 1
    print("%-44s %-8s %-8s %s" % (name, "cull" if a else "keep", "cull" if b else "keep", "OK" if ok else "*** MISMATCH ***"))

random.seed(7)
mism = []
for _ in range(4000):
    x = random.uniform(-900, 1700); y = random.uniform(-900, 2200)
    r = random.uniform(1, 700);     w = random.uniform(0, r * 1.5)
    a = pred_cull(x, y, r, w)
    # only brute-force the cheap-to-reject cases: skip rings clearly covering the room
    inner = inner_of(r, w)
    if inner <= 1 and 0 <= x <= RW and 0 <= y <= RH:   # certainly visible
        b = False
    elif r > 1400 and inner < 1400:
        b = False                                       # whole room inside the band
    else:
        b = brute_cull(x, y, r, w)
    if a != b:
        mism.append((round(x,1), round(y,1), round(r,1), round(w,1), a, b))
print()
print("random fuzz: 4000 configs, mismatches =", len(mism))
for m in mism[:8]:
    print("   x=%s y=%s r=%s w=%s  GML=%s brute=%s" % m)
