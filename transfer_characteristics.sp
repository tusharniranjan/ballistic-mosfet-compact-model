* NMOS Ballistic Model Transfer Characteristic Testbench - Tushar Niranjan
simulator lang=spectre
ahdl_include "nmos_ballistic_model.va"
saveOptions options save=allpub currents=all
simulator lang=spice


M0 D G S B nmos_ballistic W=1e-6 Cox=1.5e-6 VT0=0.4 delta=0.05 m=1.2 mr=0.19 Tjun=300

Vsource S 0 DC 0
Vbody   B 0 DC 0
Vgate   G 0 DC 0
Vdrain  D 0 DC 0

.dc Vgate 0 1 0.01 Vdrain 0.05 1 0.475

.end