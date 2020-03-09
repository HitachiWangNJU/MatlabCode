%% ------------ PS score code ----------------%%  
%  This code is used to calculate PS score for climate prediction
%  writter by Hitachi WAWNG
%  reference from Xuguang SUN
%  date: 20191209
%  PS = PS_Score_PRC(OBS_ANO_PER,FST_ANO_PER);

function[ps_score] = PS_Score_PRC(obs,fcst)
a = 2;
b = 2;
c = 4;

pvar1min = 20;
pvar1max = 50;
pvar2min = 50;
pvar3min = 100;

N = 160; % number of stations

signs = obs .* fcst;

N0 = nnz((signs >= 0));
N1 = nnz(signs >= 0 & abs(obs) >= pvar1min & abs(obs) <= pvar1max & abs(fcst) >= pvar1min & abs(fcst) <= pvar1max);
N2 = nnz(signs >= 0 & abs(obs) >= pvar2min & abs(fcst) >= pvar2min);
M  = nnz(N2 == 0 & abs(obs) >= pvar3min);

ps_score = (a*N0+b*N1+c*N2)/(N-N0+a*N0+b*N1+c*N2+M)*100;
