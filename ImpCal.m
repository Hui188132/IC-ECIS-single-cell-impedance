%%%%%%%%%%%%%
%User Input
Gain = 0 ; %According to your setting in main_SPI;
InAmp = 198.1e-3; %Input amplitude in V;
OutAmp = 333.5e-3; %Output amplitude in V;
PhaseDiff = 178.8; %Phase of out reference to in (degree)
%%%%%%%%%%

Gain = uint8(Gain);
RealPhase=(PhaseDiff+180)*pi/180; %in radian
R1=733.6/1000;
R2=1.274e3*2/1000;
Rfb=1000*[20+R1*4,40+R1*3+R2,100+R1*3+R2,120+R1*2+R2*2,340+R1*3+R2,360+R1*2+R2*2,420+R1*2+R2*2,440+R1*3+R2,12600+R1*3+R2,12620+R1*2+R2*2,12680+R1*2+R2*2,12700+R1+R2*3,12920+R1*2+R2*2,12940+R1+R2*3,13000+R1+R2*3,13020+R2*4];
Zamp=Rfb(Gain+1)*InAmp/(OutAmp*(cos(RealPhase)+1i*sin(RealPhase)));

RealZamp = real(Zamp)-500
ImagZamp = imag(Zamp)