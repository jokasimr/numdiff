

finite_derivative = @(h) (exp(1+h)-exp(1))/h;
derivative = exp(1);


n = 300
hs = (10*ones(1, n)).^linspace(0, -15, n);
errors = zeros(1, length(hs));
for k=1:length(hs)
    errors(k) = abs(finite_derivative(hs(k)) - derivative);
end


[C, I] = min(errors)
loglog(hs(1:I), errors(1:I), 'b');
hold on
loglog(hs(I:end), errors(I:end), 'r');

    