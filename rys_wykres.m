function []=rys_wykres(k_max,n,n_iter,d,d_iter,r_iter,rodzaj,b_rand,A_rand,A_rand_d)
 %% rys_wykres
 % funkcja przyjmuje:
 % k_max - maksymalna liczba iteracji (@jacoby)
 % n - rozmiar macierzy(wektor poziomy) (@uklad)
 % d- parametr definiujacy dokladnosc(wektor poziomy) (@jacoby)
 % n_iter - liczba iteracji funkcji spr_n(ile razy ma sprawdzic uklad o
 % podanych rozmiarach) (@spr_n)
 % d_iter - liczba iteracji funkcji spr_d(ile razy ma sprawdzic uklad z
 % danym parametrem definujacym dokladnosc) (@spr_d)
 % r_iter - liczba iteracji funkcji spr_r(ile razy ma sprawdzic układ) (@spr_r)
 % rodzaj - rodzaj ukladu A*x=b ze wzgledu na liczbe rozwiazan (@uklad)
 % b_rand - przedzial z ktorego losowane sa dane do wektora b, (postac-[a,b])(@uklad)
 % A_rand - przedzial z ktorego losowane sa dane do macierzy A poza glowna przekatna, (postac-[a,b])(@uklad)
 % A_rand_d - przedzial z ktorego losowane sa dane do  glownej przekatnej macierzy A,(postac-[a,b])(@uklad)
 % funkcja rysuje wykresy
 
wynik_n=spr_n(@jacoby,@odnosnik,@uklad,k_max,n,d(1,floor(length(d)/2)),n_iter,rodzaj,b_rand,A_rand,A_rand_d);
xn=wynik_n(:,1);
y1=wynik_n(:,2);
y2=wynik_n(:,3);
y3=wynik_n(:,4);
 
wynikj_r=spr_r(@jacoby,@odnosnik,@uklad,k_max,n(1,floor(length(n)/2)),d(1,floor(length(d)/2)),r_iter,rodzaj,b_rand,A_rand,A_rand_d);
xr=wynikj_r(:,1);
y4=wynikj_r(:,2);
y5=wynikj_r(:,3);
y6=wynikj_r(:,4);

wynik_d=spr_d(@jacoby,@odnosnik,@uklad,k_max,n(1,floor(length(d)/2)),d,d_iter,rodzaj,b_rand,A_rand,A_rand_d);
xd=wynik_d(:,1);
y7=wynik_d(:,2);
y8=wynik_d(:,3);
y9=wynik_d(:,4);

figure;

subplot(3,3,1);
scatter(xn,y1,'b');
h1 = lsline;
h1.Color = 'b';
title('Wykres 1','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('n');
ylabel('czas');

subplot(3,3,2);
scatter(xn,y2,'b');
h2 = lsline;
h2.Color = 'b';
title('Wykres 2','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('n');
ylabel('błąd przybliżenia');

subplot(3,3,3);
scatter(xn,y3,'b');
h3 = lsline;
h3.Color = 'b';
title('Wykres 3','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('n');
ylabel('liczba iteracji');

subplot(3,3,4);
scatter(xr,y4,'b');
h4 = lsline;
h4.Color = 'b';
title('Wykres 4','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('r');
ylabel('czas');

subplot(3,3,5);
scatter(xr,y5,'b');
h5 = lsline;
h5.Color = 'b';
title('Wykres 5','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('r');
ylabel('błąd przybliżenia');

subplot(3,3,6);
scatter(xr,y6,'b');
h6 = lsline;
h6.Color = 'b';
title('Wykres 6','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('r');
ylabel('liczba iteracji');

subplot(3,3,7);
scatter(xd,y7,'b')
set(gca,'xscale','log')
title('Wykres 7','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('d');
ylabel('czas');

subplot(3,3,8);
scatter(xd,y8,'b')
set(gca,'xscale','log')
set(gca,'yscale','log')
title('Wykres 8','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('d');
ylabel('błąd przybliżenia');

subplot(3,3,9);
scatter(xd,y9,'b')
set(gca,'xscale','log')
title('Wykres 9','FontSize',14);
legend({'jacoby'},'Location','best');
xlabel('d');
ylabel('liczba iteracji');

end