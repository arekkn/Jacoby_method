function [wynik]=odnosnik(A,b)
%% odnosnik
% A - macierz ta sama co do @jacoby
% b - wektor ten sam co do @jacoby
% wynik - wektor x, Ax=b
wynik=(A\b)';
end