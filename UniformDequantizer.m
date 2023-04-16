% requirment 2 
function deq_ind = UniformDequantizer(q_ind, n_bits, xmax, m)
    l = 2.^n_bits;
    delta = 2*xmax/l;
    m=1-m;
    min_range = m*(delta/2)-xmax;
    deq_ind= zeros(1,length(q_ind));
    index=1;
    for i=q_ind
        deq_ind(index)=((i-m)*delta)+min_range;
        index=index+1;
    end
end


