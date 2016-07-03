function J = cost_function_factory(x, y)
	m = size(x)(1);
	J = @(theta) (sum(((x * theta) .- y) .^ 2) / (2 * m));
end

function ret = step(theta, x, y, alpha)
	m = size(x)(1);
	ret = [];
	for j=1:length(1:length(theta))
		ret = [
			ret
			theta(j) - alpha * (sum(((x * theta) .- y) .* x(:, j)) / m)
		];
	end
end

data = load('ex1data1.txt');

x = data(:, 1);
m = size(x)(1);
x = [ones(m, 1) x];

y = data(:, 2);

J = cost_function_factory(x, y);

theta = [0; 0];
alpha = 0.01;

n_iterations = 1000;

Js = [];
for i=1:n_iterations
	theta = step(theta, x, y, alpha);
	Js = [
		Js
		J(theta)
	];
end

display(theta);

%figure;
%plot(1:n_iterations, Js, 'rx');
%xlabel('Number of iterations');
%ylabel('Value of J');

figure;
plot(x(:, 2), y, 'rx');
hold on;
plot(x(:, 2), x * theta, 'b-');
legend('Actual data', 'Expected growth');
print -djpg foo.jpg
pause
