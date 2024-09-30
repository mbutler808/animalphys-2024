m = 2500*1000
bmr = 50.4*(m)^.73/1000 # in kJ/hr
rmr = 1.2*bmr # in kJ/hr

### Hc
Tb = 37
Ta=30
deltaT = Tb-Ta

C=20.5*m^-.426
Hc= C*m*deltaT
Hc = Hc/1000 # in kJ/hr

### He
Xexp = 44 # mg/l air
Xinsp = 30.4 * .75 # mg/l 
Vair = rmr*24 / (20*.2*.25)   # kJ/hr * 24 hr/day / 20

REWL = Vair*(Xexp - Xinsp)/1000  # in g/day

l = 400  # cm lenth torso
r = 87.5 # cm radius torso
SAtorso = 2*pi*r*l + 2*pi*r^2 # 268017.1cm2

l=600 # cm tail length
r=25  # cm tail radius
SAtail = 2*pi*r*l  # 94247.78 cm2

SA = SAtorso + SAtail
resistance = 100 # sec/cm
CEWL = (Xexp - Xinsp)*SA/resistance/1000
CEWL = CEWL/1000*60*60*24  # in g/day

EWL = (REWL + CEWL)
Qevap = 2.4
He = EWL*Qevap
He = He/24

Hr = .180*SA/2 # in kJ/hr

