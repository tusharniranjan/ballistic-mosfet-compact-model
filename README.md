# Ballistic N-Type MOSFET (Verilog-A)

A small Verilog-A compact model of a ballistic n-channel MOSFET, made for fun. It covers subthreshold, linear and saturation regions in one smooth equation, with DIBL included. Simulated in Cadence Spectre.

Based on *Essentials of MOSFETs* by Mark Lundstrom.

## What's where

| File | What it is |
|---|---|
| `nmos_ballistic_model.va` | The model |
| `output_characteristics.sp` | Testbench: I<sub>D</sub> vs V<sub>DS</sub> (V<sub>GS</sub> = 0.4 to 1.0 V) |
| `transfer_characteristics.sp` | Testbench: I<sub>D</sub> vs V<sub>GS</sub> (V<sub>DS</sub> = 0.05, 0.525, 1.0 V) |
| `docs/` | Plots from the two testbenches |

## The model

$$I_D \approx W \cdot |Q_n(V_{GS})| \cdot v_T \cdot \frac{1 - e^{-qV_{DS}/k_BT}}{1 + e^{-qV_{DS}/k_BT}}$$

$$Q_n = -C_{OX}\, m\, \frac{k_BT}{q} \ln\left(1 + e^{q(V_{GS}-V_T)/mk_BT}\right), \quad v_T = \sqrt{\frac{2k_BT}{\pi m^*}}, \quad V_T = V_{T0} - \delta V_{DS}$$

Parameters (defaults): `W`=1e-6 cm, `Cox`=1.5e-6 F/cm², `VT0`=0.4 V, `delta`=0.05, `m`=1.2, `mr`=0.19, `Tjun`=300 K.

## Running it

Keep the `.va` and `.sp` files in the same folder, then:

```bash
spectre output_characteristics.sp
spectre transfer_characteristics.sp
```

## Results

**Output characteristics**: current saturates quickly, reaching about 12 µA at V<sub>GS</sub> = 1 V.

![Output characteristics](docs/output_characteristics.png)

**Transfer characteristics**: clean exponential subthreshold region, smooth rollover above threshold, and a leftward shift at higher V<sub>DS</sub> (DIBL).

![Transfer characteristics](docs/transfer_characteristics.png)

## Notes

DC only. No scattering, series resistance, body effect or capacitances.
