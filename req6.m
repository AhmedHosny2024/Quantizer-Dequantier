% requirment 4
x = exprnd(1,1,10000);
xmax = max(abs(x));
r = randi([0,1],1,10000);
r = r * 2 ;
r = r - 1 ;
x=x.*r;



n_bits= 2:1:8;
sig_mean=mean(x.^2);
SNR=zeros(1,length(n_bits+1));
real_SNR=zeros(1,length(n_bits+1));

m=0;
index=1;
m_size=[5, 100, 200];
x=x/xmax;
xmax2 = max(abs(x));

figure;
%case mu = 0 
for i = n_bits
    q = UniformQuantizer(x, i, xmax2, m);
    deq=UniformDequantizer(q, i, xmax2, m);
    error = deq-x;
    error_value = mean(error.^2);
    SNR(index) = sig_mean/error_value;
    real_SNR(index)=3*sig_mean*(2.^(2*i) / xmax.^2);
    index=index+1;
end
hold on
plot(n_bits,10*log10(SNR));
plot(n_bits,10*log10(real_SNR));
%case mu = 2 5 100 
index=1;
for w = m_size
    %comprise
    comp=((log(1+(abs(x)*w)))/log(1+w)).*r;    
    for i = n_bits
        q = UniformQuantizer(comp, i, 1, m);
        deq=UniformDequantizer(q, i, 1, m);
        
        %expand
        expand=((exp(abs(deq)*log(1+w)))-1)/w;
        expand=r.*expand;
        
        error = (expand-x)*xmax;
        error_value = mean(error.^2);
        SNR(index) = sig_mean/error_value;
        real_SNR(index)=3*(2.^(2*i) / ((log(1+w)).^2));
        index=index+1;
    end
    hold on
    plot(n_bits,10*log10(SNR));
    plot(n_bits,10*log10(real_SNR));
    title("SNR midrise")
    index=1;
end
legend({'SNR1','Real SNR1','SNR2','Real SNR2','SNR3','Real SNR3','SNR4','Real SNR4'},'Location','northwest')
xlabel("n bits")
ylabel('output')






