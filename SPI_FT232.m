function [] = SPI_FT232(fclk,data,cs_channel)
%SPI_FT232 Summary of this function goes here
%   Detailed explanation goes here
Libname = 'libMPSSE';
if (cs_channel==3)
    chan_mod=uint32(0);
elseif (cs_channel==4)
    chan_mod=uint32(1);
elseif (cs_channel==5)
    chan_mod=uint32(2);
elseif (cs_channel==6)
    chan_mod=uint32(3);
else
    chan_mod=uint32(4);
end
fclk=round(fclk);
if ~libisloaded( Libname )
	loadlibrary( Libname, 'libMPSSE_spi_matlabFriendly.h');
end


transfer_options = 6; % No chip select used.

pNumchannels = libpointer('uint32Ptr',255);
pNumBytesTransferred = libpointer('uint32Ptr',255);
pChannelHandle = libpointer('voidPtr',255);

calllib(Libname,'SPI_GetNumChannels',pNumchannels); pause(0.001);
sprintf('Channels Found: %d',get(pNumchannels,'value'))

ChConfig.ClockRate = uint32(fclk); % Clock speed, Hz
ChConfig.LatencyTimer = uint8(2); % Users guide section 3.4, suggested value is 2-255 for all devices
ChConfig.configOptions = uint32(32+chan_mod*4+2); % Bit 1 is CPOL, bit 0 is CPHA.  Higher order bits configure the chip select.
ChConfig.Pin =uint32(0xFFFFFFFF);

calllib(Libname,'SPI_OpenChannel',0,pChannelHandle); 
% pause(0.001);
calllib(Libname,'SPI_InitChannel',pChannelHandle,ChConfig);
% pause(0.001);
calllib(Libname,'SPI_Write',pChannelHandle,data,length(data),pNumBytesTransferred,transfer_options);

% Clean up
calllib(Libname,'SPI_CloseChannel',pChannelHandle);

return

end

