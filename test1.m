clc 
clear
goals=[87,72,68,81,79,76,59,73,57,68,77,74,58,66,56,65,54,63,51,54,63,27];
% The variable goals is the number of goals scored by the 22 soccer clubs in the 2005 Brazilian
% Soccer Championship
wins=[24,23,22,20,19,18,17,17,17,16,16,15,16,15,14,14,14,15,13,13,12,10];
%The variable wins is the number of wins by the 22 soccer clubs in the 2005
%Brazilian Soccer Championship
%For Example: Palmeiras scored 81 goals throughout the season and won 20
%games and ended the seasonas the 4th place team
subplot(2,1,1)
plot(goals,wins,'x') %x becomes the symbol used on the graph
model=fitlm(goals,wins)%creates a linear model
title('2005 Brazilian Soccer Championship');
xlabel('Goals Scored');
ylabel('Number of Wins');
subplot(2,1,2) % creates secon graph
plotResiduals(model,'fitted') %creates a residual plot


