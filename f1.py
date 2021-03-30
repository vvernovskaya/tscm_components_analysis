def read(filename, x, y, z):
    with open(filename) as f:
        lines = f.readlines()
    data=[]
    for k in lines:
        if len(k) > 17:
            d=[]
            for m in lines:
                if len(m) > 17 and abs(float(m.split()[3])-float(k.split()[3])) <= x and abs(float(m.split()[4])-float(k.split()[4])) <= y and abs(float(m.split()[2])-float(k.split()[2])) <= z:
                    d.append(m)
            data.append(d)
    return data