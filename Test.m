% requirment 3
x = -6:0.01:6;
n_bits= 3;
xmax = 6;
m=0;
q = UniformQuantizer(x, n_bits, xmax, m) ;
deq=UniformDequantizer(q, n_bits, xmax, m);

figure;
hold on
plot(x,x);
plot(x,deq);
title("ramp midrise ")
legend({'input','output'},'Location','northwest')
xlabel("input")
ylabel('output')
deq
m=1;
q = UniformQuantizer(x, n_bits, xmax, m) ;
deq=UniformDequantizer(q, n_bits, xmax, m);

figure;
hold on
plot(x,x);
plot(x,deq);
title("midtread")
legend({'input','output'},'Location','northwest')
xlabel("input")
ylabel('output')
