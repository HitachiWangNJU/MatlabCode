function nctimeStr = nctimeNum2Str(nctimeNum,Unit)
% This function is used to transfor time format from Num to Str.
% As I now TimeData has 2 kinds of UNIT, day and hour, so you should choose
% the right Time Unit.
% As I now TimeData usually since 1800-01-01 00:00:00
% Written by Hitachi Wang
% Date 2020-03-08

switch Unit
    case 'day'
        SinceDateString = '1800-01-01';
        formatIn = 'yyyy-mm-dd';
        timesince = datenum(SinceDateString,formatIn);
        timetrans = nctimeNum + timesince;
        nctimeStr = datestr(timetrans,formatIn);
    case 'hour'
        SinceDateString = '1800-01-01';
        formatIn = 'yyyy-mm-dd';
        timesince = datenum(SinceDateString,formatIn);
        timetrans = nctimeNum./24 + timesince;
        nctimeStr = datestr(timetrans,formatIn);
    otherwise
        disp('you should input String ->day<- or ->hour<-');
end
