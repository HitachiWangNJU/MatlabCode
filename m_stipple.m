function h = m_stipple(x,y,mask,varargin)
% stipple creates a hatch filling or stippling within a grid. This
% function is designed primarily to show regions of statistical 
% significance in spatial maps. 
% of course for put mark on m_map, should transfor [lon,lat] to
% [x_map,y_map] use m_ll2xy.

%% Syntax
% 
%  stipple(x,y,mask) 
%  stipple(...,MarkerProperty,MarkerValue,...)
%  stipple(...,'density',DensityValue) 
%  stipple(...,'resize',false) 
%  h = stipple(...)
% 
%% Description
% 
% stipple(x,y,mask) plots black dots in x,y locations wherever a mask contains
% true values. Dimensions of x, y, and mask must all match. 
% 
% stipple(...,MarkerProperty,MarkerValue,...) specifies any marker properties
% that are accepted by the plot function (e.g., 'color', 'marker', 'markersize', etc). 
%  
% stipple(...,'density',DensityValue) specifies density of stippling markers. 
% Default density is 100, but if your plot is too crowded you may specify a 
% lower density value (and/or adjust the markersize). 
% 
% stipple(...,'resize',false) overrides the 'density' option and plots stippling 
% at the exact resolution of the input grid. By default, the grids are resized
% because any grid larger than about 100x100 would produce so many stippling
% dots it would black out anything under them. 
% 
% h = stipple(...) returns a handle of the plotted stippling objects. 
% 
%% Examples
% 
% % Load some sample data: 
% [X,Y,Z] = peaks(1000); 
% 
% % Let's say everywhere Z exceeds 2.5 is good: 
% mask = Z>2.5; 
% 
% % Plot it up: 
% figure
% pcolor(X,Y,Z)
% shading interp
% hold on
% 
% % FOUR DIFFERENT WAYS TO USE STIPPLE: 
% 
% stipple(X,Y,mask)
% 
% % Plot gray dots instead of the default black: 
% stipple(X,Y,mask,'color',0.5*[1 1 1]) 
% 
% % Plot fewer dots: 
% stipple(X,Y,mask,'density',30) 
%
% % Plot large red plus signs: 
% stipple(X,Y,mask,'density',75,'color','r','marker','+','markersize',9)
% 
% % Plot on m_map
% m_stipple(lon,lat,mask,~)
%% Author Info
% function stipple.m was written by Chad A. Greene, August 2018. 
% function m_stipple.m was written by Hitachi Wang, 2020.3

%% function
[lx,ly] = m_ll2xy(x,y);
h = stipple(lx,ly,mask,varargin{:});
