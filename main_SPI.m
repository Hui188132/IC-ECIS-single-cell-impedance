% ///////////////////////////////
% Do Not EDIT this part
L=24;
channel=3;
fclk=.03e6;
% ///////////////////////////////

%////////// User Config section
Gain=0; % 0 -15, 15 is highest
SelRow=1; %Select the Row for experiment (0-15)
SelCol_TX=5; % Select the column for excitation (injecting signal) (0-23)
SelCol_RX=4; % Select the column to receive the signal (0-23)
ExcEN=0; % 0:Without buffer, 1: with buffer
% /////////////////

data_in=uint8(zeros(1,3));
data_in(3)=SelRow*2^4+Gain;
data_in(2)=SelCol_RX;
data_in(1)=SelCol_TX+2^5*ExcEN;

SPI_FT232(fclk,data_in,channel); 