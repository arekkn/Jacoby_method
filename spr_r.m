function [wynik]=spr_r(jacoby,odnosnik,uklad,k_max,n,d,r_iter,rodzaj,b_rand,A_rand,A_rand_d)
%% spr_r
 % funkcja przyjmuje:
 % jacoby - @jacoby
 % odnonnik - @odnosnik
 % uklad - @uklad
 % k_max - maksymalna liczba iteracji (@jacoby)
 % n - rozmiar macierzy (@uklad)
 % d- parametr definiujący dokladnosc (@jacoby)
 % r_iter - liczba iteracji funkcji spr_r(ile razy ma sprawdzic uklad)
 % rodzaj - rodzaj ukladu A*x=b ze wzgledu na liczbe rozwiazan (@uklad)
  % b_rand - przedzial z ktorego losowane sa dane do wektora b, (postac-[a,b])(@uklad)
 % A_rand - przedzial z ktorego losowane sa dane do macierzy A poza glowna przekatna, (postac-[a,b])(@uklad)
 % A_rand_d - przedzial z ktorego losowane sa dane do  glownej przekatnej macierzy A,(postac-[a,b])(@uklad)
 % funkcja zwraca:
 % wynik(row,1)=j(1,3) - promien spekralny macierzy iteracji w metodzie Jacobiego @jacoby
 % wynik(row,2)=j(1,1) - czas wykonywania obliczen usredniony z 5 prob @jacoby
 % wynik(row,3)=sum(abs((j(1,4:end)-odn)./odn))/n - blad wzgledny
 % uzyskanego wyniku @jacoby, @odnosnik
 % wynik(row,4)=j(1,2) - liczba wykonanych iteracji @jacoby
wynik=zeros(r_iter,4);
for row=1:r_iter
    A_b=uklad(rodzaj,n,b_rand,A_rand,A_rand_d);
    A=A_b(:,1:n);
    b=A_b(:,n+1);
    j=jacoby(A,b,d,k_max);
    odn=odnosnik(A,b);
    wynik(row,1)=j(1,3);
    wynik(row,2)=j(1,1);
    wynik(row,3)=sum(abs((j(1,4:end)-odn)./odn))/n;
    wynik(row,4)=j(1,2);
end
end