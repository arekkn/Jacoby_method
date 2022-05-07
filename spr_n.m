function [wynik]=spr_n(jacoby,odnosnik,uklad,k_max,n,d,n_iter,rodzaj,b_rand,A_rand,A_rand_d)
 %% spr_n
 % funkcja przyjmuje:
 % jacoby - @jacoby
 % odnonnik - @odnosnik
 % uklad - @uklad
 % k_max - maksymalna liczba iteracji (@jacoby)
 % n - rozmiar macierzy(wektor poziomy) (@uklad)
 % d- parametr definiujacy dokladnosc (@jacoby)
 % n_iter - liczba iteracji funkcji spr_n(ile razy ma sprawdzic uklad o podanych rozmiarach)
 % rodzaj - rodzaj ukladu A*x=b ze wzgledu na liczbe rozwiazan (@uklad)
 % b_rand - przedzial z ktorego losowane sa dane do wektora b, (postac-[a,b])(@uklad)
 % A_rand - przedzial z ktorego losowane sa dane do macierzy A poza glowna przekatna, (postac-[a,b])(@uklad)
 % A_rand_d - przedzial z ktorego losowane sa dane do  glownej przekatnej macierzy A,(postac-[a,b])(@uklad)
 % funkcja zwraca:
 % wynik(row,1)=n(1,k) - rozmiar macierzy dla której wywoluje funkcję @jacoby
 % wynik(row,2)=j(1,1) - czas wykonywania obliczeń usredniony z 5 prob @jacoby
 % wynik(row,3)=sum(abs((j(1,4:end)-odn)./odn))/n(1,k) - blad wzgledny
 % uzyskanego wyniku @jacoby, @odnosnik
 % wynik(row,4)=j(1,2) - liczba wykonanych iteracji @jacoby
 
wynik=zeros(length(n)*n_iter,4);
for iter=1:n_iter
    for k=1:length(n)
        A_b=uklad(rodzaj,n(1,k),b_rand,A_rand,A_rand_d);
        A=A_b(:,1:n(1,k));
        b=A_b(:,n(1,k)+1);
        j=jacoby(A,b,d,k_max);
        odn=odnosnik(A,b);
        row=(iter-1)*length(n)+k;
        wynik(row,1)=n(1,k);
        wynik(row,2)=j(1,1);
        wynik(row,3)=sum(abs((j(1,4:end)-odn)./odn))/n(1,k);
        wynik(row,4)=j(1,2);
    end
end
end

