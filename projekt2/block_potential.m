function blocks = block_potential(x0s, ks, hs)
    
    
    function V = potential(x) 
        N = length(x);
        V = zeros(1, N);
        for i=1:length(x0s)
            x0 = x0s(i);
            if length(ks)>1
                k = ks(i);
            else
                k = ks;
            end
            if length(hs)>1
                h = hs(i);
            else
                h = hs;
            end
            low = max([ceil(N*x0 - k*N), 1]);
            high = min([ceil(N*x0 + k*N), N]);
            V(low:high) = h;
        end    
    end
    blocks = @potential;
end

