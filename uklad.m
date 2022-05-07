function [wynik]=uklad(rodzaj,n,b_rand,A_rand,A_rand_d)
 %% uklad
 % funkcja przyjmuje:
 % n - rozmiar macierzy 
 % rodzaj - rodzaj ukladu A*x=b ze wzgledu na liczbe rozwiazan:
 % "sprzeczny" - brak rozwiązan
 % "nieskonczony" - nieskonczenie wiele rozwiązan
 % "tak"(dowolny inny string) - macierz A przekatniowo dominantna więc metoda
 % Jacobiego zbiezna
 % b_rand - przedzial z ktorego losowane sa dane do wektora b, (postac-[a,b])
 % A_rand - przedzial z ktorego losowane sa dane do macierzy A poza glowna przekatna, (postac-[a,b])
 % A_rand_d - przedzial z ktorego losowane sa dane do  glownej przekatnej macierzy A,(postac-[a,b])
 % funkcja zwraca:
 % wynik(:,1:n)=A - wylosowana macierz A
 % wynik(:,n+1)=b - wylosowany wektor b 
wynik=zeros(n,n+1);
A=randi(A_rand,n,n);
for i=1:n
    for j=1:n
        if abs(i-j)>=4
            A(i,j)=0;
        end
    end
    A(i,i)=randi(A_rand_d,1,1);
end
b=randi(b_rand,n,1);
if rodzaj == "sprzeczny"
    A(n-1,n-4)=0;
    A(n,:)=A(n-1,:);
    b(n,:)=b(n-1,:)+1;
elseif rodzaj == "nieskonczony"
    A(n-1,n-4)=0;
    A(n,:)=A(n-1,:);
    b(n,:)=b(n-1,:);
else  
end
wynik(:,1:n)=A;
wynik(:,n+1)=b;
end