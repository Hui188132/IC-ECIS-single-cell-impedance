MATLAB 2018

download: https://login.mathworks.com/embedded-login/signin.html?cid=wdnl&uri=https%3A%2F%2Fwww.mathworks.com%2Fdownloads%2F


The code is used for communicate with IC chips.

1.Select the row and column electrodes that we want to measure.

2. Select the system gain.

3. Calculate the impedance magnitude based on output data.


main_SPI.m : SPI communication


ImpCal.m : Calculate the impedance magnitude

Note: We developed the code for single cell impedance measurement in MATLAB, 
but it must be used with the chip. We packaged and uploaded the schematic diagram of the chip (open it with cadence)
