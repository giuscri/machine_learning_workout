data = load('ex2data2.txt');

X = data(:, 1:2);
y = data(:, 3);

accepted = [];
rejected = [];

m = length(y);

for i = 1:m
	if y(i) == 1
		accepted = [accepted; X(i, :)];
	else
		rejected = [rejected; X(i, :)];
	end
end

assert(size(accepted)(1) + size(rejected)(1) == size(X)(1))

figure;
hold on;

plot(accepted(:, 1), accepted(:, 2), 'k+', ...
	'linewidth', 2, 'markersize', 7);

plot(rejected(:, 1), rejected(:, 2), 'ko', ...
	'markerfacecolor', 'y');

xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('Accepted', 'Rejected')

pause
