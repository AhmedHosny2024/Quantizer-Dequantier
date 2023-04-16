% requirment 1 
function q_ind = UniformQuantizer(in_val, n_bits, xmax, m)
    l = 2.^n_bits;
    delta = 2*xmax/l;
    min_range = m*(delta/2)-xmax;
    q_ind= zeros(1,length(in_val));
    index=1;
    for i=in_val
        x=i;
        if(i < min_range )
            x = min_range;
        end
        q_ind(index)=min(floor((x-min_range)/delta)+1 , l);
        index=index+1;
    end
end


