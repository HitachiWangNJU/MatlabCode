function GridData = Std2GridN(lat,lon,Var,plat,plon,max,min)
F = scatteredInterpolant(lat,lon,Var,'natural','linear');
grid = F(plat,plon);
GridData = LimitLevel(grid,max,min);
ChinaB =shaperead('bou1_4p.shp');  % MAP data
isin=inpolygon(plon,plat,[ChinaB(:).X],[ChinaB(:).Y]); %meshgrid BoundX BoundY
GridData(~isin)=NaN; % Mask Out
% pp3(isin) = NaN; % Mask In