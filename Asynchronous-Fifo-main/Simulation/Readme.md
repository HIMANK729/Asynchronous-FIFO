## Testbench

The data **WIDTH** is chosen as 4 and FIFO **DEPTH** is chosen as 8. Random data is generated and given to the `wdata` port. The `rst_n` signal is used to reset the read & write pointers and assert the empty flag.

### Outputs

- A three-cycle delay is observed in de-asserting the empty flag because the write-pointer update is reflected in the read clock domain only after three cycles.
- Data written into the write clock domain is successfully synchronized and read in the read clock domain.
OUTPUT:-
VCD info: dumpfile fifo_waveform.vcd opened for output.
WRITE: data=0 wptr=1 @75000
WRITE: data=8 wptr=2 @155000
WRITE: data=6 wptr=3 @235000
WRITE: data=12 wptr=4 @315000
READ OK: 0 rptr=0 @336000
WRITE: data=14 wptr=5 @395000
READ OK: 8 rptr=1 @456000
WRITE: data=7 wptr=6 @475000
WRITE: data=6 wptr=7 @555000
READ OK: 6 rptr=2 @576000
WRITE: data=3 wptr=0 @635000
READ OK: 12 rptr=3 @696000
WRITE: data=3 wptr=1 @715000
WRITE: data=15 wptr=2 @795000
READ OK: 14 rptr=4 @816000
WRITE: data=7 wptr=3 @875000
READ OK: 7 rptr=5 @936000
WRITE: data=9 wptr=4 @955000
WRITE: data=14 wptr=5 @1035000
READ OK: 6 rptr=6 @1056000
WRITE: data=5 wptr=6 @1115000
ERROR: Expected 3, got x @1176000 (rptr=7)
WRITE: data=13 wptr=7 @1275000
READ OK: 3 rptr=0 @1296000
WRITE: data=1 wptr=0 @1355000
READ OK: 15 rptr=1 @1416000
WRITE: data=14 wptr=1 @1515000
READ OK: 7 rptr=2 @1536000
WRITE: data=15 wptr=2 @1595000
READ OK: 9 rptr=3 @1656000
WRITE: data=12 wptr=3 @1755000
READ OK: 14 rptr=4 @1776000
WRITE: data=9 wptr=4 @1835000
READ OK: 5 rptr=5 @1896000
WRITE: data=3 wptr=5 @1995000
READ OK: 13 rptr=6 @2016000
WRITE: data=12 wptr=6 @2075000
ERROR: Expected 1, got x @2136000 (rptr=7)
WRITE: data=12 wptr=7 @2235000
READ OK: 14 rptr=0 @2256000
WRITE: data=15 wptr=0 @2315000
READ OK: 15 rptr=1 @2376000
WRITE: data=1 wptr=1 @2475000
READ OK: 12 rptr=2 @2496000
WRITE: data=1 wptr=2 @2555000
READ OK: 9 rptr=3 @2616000
WRITE: data=0 wptr=3 @2715000
READ OK: 3 rptr=4 @2736000
WRITE: data=1 wptr=4 @2795000
READ OK: 12 rptr=5 @2856000
WRITE: data=15 wptr=5 @2955000
READ OK: 12 rptr=6 @2976000
WRITE: data=1 wptr=6 @3035000
ERROR: Expected 15, got x @3096000 (rptr=7)
WRITE: data=6 wptr=7 @3195000
READ OK: 1 rptr=0 @3216000
WRITE: data=10 wptr=0 @3275000
READ OK: 1 rptr=1 @3336000
WRITE: data=5 wptr=1 @3435000
READ OK: 0 rptr=2 @3456000
WRITE: data=5 wptr=2 @3515000
READ OK: 1 rptr=3 @3576000
WRITE: data=7 wptr=3 @3675000
READ OK: 15 rptr=4 @3696000
WRITE: data=9 wptr=4 @3755000
READ OK: 1 rptr=5 @3816000
WRITE: data=3 wptr=5 @3915000
READ OK: 6 rptr=6 @3936000
WRITE: data=7 wptr=6 @3995000
ERROR: Expected 10, got x @4056000 (rptr=7)
WRITE: data=12 wptr=7 @4155000
READ OK: 5 rptr=0 @4176000
WRITE: data=6 wptr=0 @4235000
READ OK: 5 rptr=1 @4296000
WRITE: data=0 wptr=1 @4395000
READ OK: 7 rptr=2 @4416000
WRITE: data=8 wptr=2 @4475000
READ OK: 9 rptr=3 @4536000
WRITE: data=7 wptr=3 @4635000
READ OK: 3 rptr=4 @4656000
WRITE: data=14 wptr=4 @4715000
READ OK: 7 rptr=5 @4776000
WRITE: data=5 wptr=5 @4875000
READ OK: 12 rptr=6 @4896000
WRITE: data=8 wptr=6 @4955000
ERROR: Expected 6, got x @5016000 (rptr=7)
WRITE: data=4 wptr=7 @5115000
READ OK: 0 rptr=0 @5136000
WRITE: data=14 wptr=0 @5195000
READ OK: 8 rptr=1 @5256000
WRITE: data=9 wptr=1 @5355000
READ OK: 7 rptr=2 @5376000
WRITE: data=12 wptr=2 @5435000
READ OK: 14 rptr=3 @5496000
WRITE: data=8 wptr=3 @5595000
READ OK: 5 rptr=4 @5616000
WRITE: data=11 wptr=4 @5675000
READ OK: 8 rptr=5 @5736000
WRITE: data=11 wptr=5 @5835000
READ OK: 4 rptr=6 @5856000
WRITE: data=8 wptr=6 @5915000
ERROR: Expected 14, got x @5976000 (rptr=7)
WRITE: data=5 wptr=7 @6075000
READ OK: 9 rptr=0 @6096000
WRITE: data=1 wptr=0 @6155000
READ OK: 12 rptr=1 @6216000
WRITE: data=7 wptr=1 @6315000
READ OK: 8 rptr=2 @6336000
WRITE: data=14 wptr=2 @6395000
READ OK: 11 rptr=3 @6456000
WRITE: data=11 wptr=3 @6555000
READ OK: 11 rptr=4 @6576000
WRITE: data=0 wptr=4 @6635000
READ OK: 8 rptr=5 @6696000
WRITE: data=7 wptr=5 @6795000
READ OK: 5 rptr=6 @6816000
WRITE: data=14 wptr=6 @6875000
ERROR: Expected 1, got x @6936000 (rptr=7)
WRITE: data=1 wptr=7 @7035000
READ OK: 7 rptr=0 @7056000
WRITE: data=3 wptr=0 @7115000
READ OK: 14 rptr=1 @7176000
WRITE: data=8 wptr=1 @7275000
READ OK: 11 rptr=2 @7296000
WRITE: data=0 wptr=2 @7355000
READ OK: 0 rptr=3 @7416000
WRITE: data=7 wptr=3 @7515000
READ OK: 7 rptr=4 @7536000
WRITE: data=7 wptr=4 @7595000
READ OK: 14 rptr=5 @7656000
WRITE: data=5 wptr=5 @7755000
READ OK: 1 rptr=6 @7776000
WRITE: data=15 wptr=6 @7835000
ERROR: Expected 3, got x @7896000 (rptr=7)
WRITE: data=2 wptr=7 @7995000
READ OK: 8 rptr=0 @8016000
WRITE: data=9 wptr=0 @8075000
READ OK: 0 rptr=1 @8136000
WRITE: data=4 wptr=1 @8235000
READ OK: 7 rptr=2 @8256000
WRITE: data=10 wptr=2 @8315000
READ OK: 7 rptr=3 @8376000
WRITE: data=2 wptr=3 @8475000
READ OK: 5 rptr=4 @8496000
WRITE: data=13 wptr=4 @8555000
READ OK: 15 rptr=5 @8616000
WRITE: data=15 wptr=5 @8715000
READ OK: 2 rptr=6 @8736000
WRITE: data=12 wptr=6 @8795000
ERROR: Expected 9, got x @8856000 (rptr=7)
WRITE: data=2 wptr=7 @8955000
READ OK: 4 rptr=0 @8976000
WRITE: data=11 wptr=0 @9035000
READ OK: 10 rptr=1 @9096000
WRITE: data=13 wptr=1 @9195000
READ OK: 2 rptr=2 @9216000
WRITE: data=8 wptr=2 @9275000
READ OK: 13 rptr=3 @9336000
WRITE: data=15 wptr=3 @9435000
READ OK: 15 rptr=4 @9456000
WRITE: data=11 wptr=4 @9515000
READ OK: 12 rptr=5 @9576000
WRITE: data=0 wptr=5 @9675000
READ OK: 2 rptr=6 @9696000
WRITE: data=2 wptr=6 @9755000
ERROR: Expected 11, got x @9816000 (rptr=7)
WRITE: data=10 wptr=7 @9915000
READ OK: 13 rptr=0 @9936000
WRITE: data=4 wptr=0 @9995000
READ OK: 8 rptr=1 @10056000
WRITE: data=2 wptr=1 @10155000
READ OK: 15 rptr=2 @10176000
WRITE: data=12 wptr=2 @10235000
READ OK: 11 rptr=3 @10296000
WRITE: data=7 wptr=3 @10395000
READ OK: 0 rptr=4 @10416000
WRITE: data=6 wptr=4 @10475000
READ OK: 2 rptr=5 @10536000
WRITE: data=8 wptr=5 @10635000
READ OK: 10 rptr=6 @10656000
WRITE: data=12 wptr=6 @10715000
ERROR: Expected 4, got x @10776000 (rptr=7)
WRITE: data=11 wptr=7 @10875000
READ OK: 2 rptr=0 @10896000
WRITE: data=12 wptr=0 @10955000
READ OK: 12 rptr=1 @11016000
WRITE: data=7 wptr=1 @11115000
READ OK: 7 rptr=2 @11136000
WRITE: data=8 wptr=2 @11195000
READ OK: 6 rptr=3 @11256000
WRITE: data=3 wptr=3 @11355000
READ OK: 8 rptr=4 @11376000
WRITE: data=14 wptr=4 @11435000
READ OK: 12 rptr=5 @11496000
WRITE: data=12 wptr=5 @11595000
READ OK: 11 rptr=6 @11616000
WRITE: data=11 wptr=6 @11675000
ERROR: Expected 12, got x @11736000 (rptr=7)
WRITE: data=6 wptr=7 @11835000
READ OK: 7 rptr=0 @11856000
WRITE: data=11 wptr=0 @11915000
READ OK: 8 rptr=1 @11976000
READ OK: 3 rptr=2 @12096000
READ OK: 14 rptr=3 @12216000
READ OK: 12 rptr=4 @12336000
READ OK: 11 rptr=5 @12456000
READ OK: 6 rptr=6 @12576000
Simulation completed with 12 errors.
testbench.sv:133: $finish called at 18316000 (1ps)

Waveform:-


<img width="1868" height="476" alt="ASYNCout" src="https://github.com/user-attachments/assets/8c0e943e-7061-480d-9674-f87d93811a75" />


