% requirment 4
x = exprnd(1,[1 10000]);
xmax = max(x);
 
r = randi([0,1],[1 10000]);
r = r * 2 ;
r = r - 1 ;
x=x.*r;

n_bits= 2:1:8;
sig_mean=mean(x.^2);
SNR=zeros(1,length(n_bits));
real_SNR=zeros(1,length(n_bits));
m=0;
index=1;
for i = n_bits
    q = UniformQuantizer(x, i, xmax, m);
    deq=UniformDequantizer(q, i, xmax, m);
    error = deq-x;
    error_value = mean(error.^2);
    SNR(index) = sig_mean/error_value;
    %real_SNR(index)=3*sig_mean*(2.^(2*i) / xmax.^2);
    real_SNR(index)=(3 * (2^i)^2 * sig_mean) / xmax^2;

    index=index+1;
end
figure;
hold on
plot(n_bits,10*log10(SNR));
plot(n_bits,10*log10(real_SNR));
title("SNR midrise")
legend({'SNR','Real SNR'},'Location','northwest')
xlabel("n bits")
ylabel('output')



