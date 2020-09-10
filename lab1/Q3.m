clear;
clc;

sz=1150-200;
sz=sz/50;
time_gepp=[];
time_nrml=[];
j=1;
for i=200:50:1150
    A=rand(i);
    b=rand(i,1);
    time_gepp(j)=gepp(A,b);
    time_nrml(j)=nrml(A,b);
    j=j+1;
end

figure;
hold on
semilogy(time_gepp)
semilogy(time_nrml)
legend('GENP','INV')
xlabel('Size')
ylabel('Time Taken')
hold off




function t=gepp(A,b)
    tic
    x=A\b;
    t=toc;
end

function t=nrml(A,b)
    tic
    x=inv(A)*b;
    t=toc;
end
