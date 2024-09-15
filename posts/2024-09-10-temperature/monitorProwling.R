Ta = 25 # ambient (environmental) temperature in C
m = 10*1000  # convert mass in kg to g

smr = 1.9*m^0.82
smr = smr/1000  # converting from J/hr to kJ/hr

amr20 = 3*smr  # this is amr at 20C

# round 1
Tb = Ta  # start by assuming body temperature at ambient

Hm = amr20*2.5^((Tb-20)/10)  # converting amr to 25C using the Q10
# setting the heat of metabolism to amr at 25C

C = 2603*m^0.148   # the scaling equation for Hc in ectotherms
C = C/1000    # convert J/hrC to kJ/hrC

deltaT = Hm/C  # solve for deltaT by setting Hm = Hc, (remember Hc = C*deltaT)

# deltaT = Tb - Ta # the difference in temp is between the body and ambient
Tb = Ta + deltaT   # lizard gained some heat from the environment; new Tb

# round 2

Hm = amr20*2.5^((Tb-20)/10)  # new Hm at new Tb
deltaT = Hm/C  # new delta T
Tb = Ta + deltaT   # new Tb

# round 3

Hm = amr20*2.5^((Tb-20)/10)  # new Hm at new Tb
deltaT = Hm/C  # new delta T
Tb = Ta + deltaT   # new Tb

# round 4

Hm = amr20*2.5^((Tb-20)/10)  # new Hm at new Tb
deltaT = Hm/C  # new delta T
Tb = Ta + deltaT   # new Tb

# So at an ambient temperature of 25C, the monitor lizardʻs body temp is 27.0C and Hm is 20.67kJ/hr