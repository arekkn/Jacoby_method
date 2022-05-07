function [wynik]=jacoby(A,b,d,kmax)
%% jacoby
% funkcja przyjmuje:
% A - macierz siedmiodiagonalna kwadratowa, działa dla macierzy size(A)>=6
% b - pionowy wektor 
% d - parametr definiujacy dokladnosc, w warunku z bledem bezwzglednym
% kmax - maksymalna liczba iteracji
% funkcja zwraca:
% wynik(1,1)=t_sredni - czas wykonywania obliczen usredniony z 5 prob
% wynik(1,2)=itr - liczba wykonanych iteracji 
% wynik(1,3)=r - promien spekralny macierzy iteracji w metodzie Jacobiego
% wynik(1,4:end)=x(1,:) - wektor wynikowy, A*x=b

n=size(A,1);
t_sr=zeros(1,5);
Aj=zeros(n,n);
for i=1:n
    Aj(i,:)=-A(i,:)/A(i,i);
    Aj(i,i)=0;
end
r=max(abs(eig(Aj)));
for j=1:5
    tic
    itr=1;
    x=zeros(1,n);
    prep_x=ones(1,n);
    for k=1:kmax
        if abs(max(prep_x-x))<d
            break
        end
        suma=sum(A(1,2:4).*x(1,2:4));
        prep_x(1)=x(1);
        x(1)=(b(1)-suma)/A(1,1);
        suma=sum(A(2,[1 3:5]).*x(1,[1 3:5]));
        prep_x(2)=x(2);
        x(2)=(b(2)-suma)/A(2,2);
        suma=sum(A(3,[1:2 4:6]).*x(1,[1:2 4:6]));
        prep_x(3)=x(3);
        x(3)=(b(3)-suma)/A(3,3);
        for i=4:n-3
            suma=sum(A(i,[i-3:i-1 i+1:i+3]).*x(1,[i-3:i-1 i+1:i+3]));
            prep_x(i)=x(i);
            x(i)=(b(i)-suma)/A(i,i);
        end
        suma=sum(A(n-2,[n-5:n-3 n-1:n]).*x(1,[n-5:n-3 n-1:n]));
        prep_x(n-2)=x(n-2);
        x(n-2)=(b(n-2)-suma)/A(n-2,n-2);
        suma=sum(A(n-1,[n-4:n-2 n]).*x(1,[n-4:n-2 n]));
        prep_x(n-1)=x(n-1);
        x(n-1)=(b(n-1)-suma)/A(n-1,n-1);
        suma=sum(A(n,n-3:n-1).*x(1,n-3:n-1));
        prep_x(n)=x(n);
        x(n)=(b(n)-suma)/A(n,n);
        itr=itr+1;
    end
    t_sr(1,j)=toc;
end
t_sredni=sum(t_sr)/5;
wynik=zeros(1,n+3);
wynik(1,1)=t_sredni;
wynik(1,2)=itr;
wynik(1,3)=r;
wynik(1,4:end)=x(1,:);
end