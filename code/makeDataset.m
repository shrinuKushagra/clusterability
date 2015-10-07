function [X, centroid] = makeDataset()
	K = 3;
	s = [2000 2000 2000];
	c = [0.0 0.0; 8.0 0.0; 0.0 8.0];

	noiseSize = 10000; noiseRange = [-10 15; -10 15];

	nicePt = makeCircle(c(1, :), 1.0, s(1));
	nicePt = [nicePt; makeCircle(c(2, :), 1.0, s(2))];
	nicePt = [nicePt; makeCircle(c(3, :), 1.0, s(3))];
	noisePt = makeNoise(noiseRange(1, :), noiseRange(2, :), noiseSize);

	X = [nicePt; noisePt];
	y = [ones(s(1), 1); 2*ones(s(2), 1); 3*ones(s(3), 1)];
	[class, centroid] = kmeans(X, K);

	plot(nicePt(:,1), nicePt(:,2), '.b');
	hold on;
	plot(centroid(:,1), centroid(:,2), '.xr');
	plot(noisePt(:,1), noisePt(:,2), '.g');
	%plot(c(:,1), c(:,2), '.ob');
end

function [pts] = makeCircle(center, radius, noPoints)
	pts = [];
	for i = 1:noPoints
		r = radius*rand();
		theta = 2*pi*rand();

		pts = [pts; center(1)+r*cos(theta) center(2)+r*sin(theta)];
	end
end

function [pts] = makeNoise(xRange, yRange, noPoints)
	pts = [];
	for i = 1:noPoints
		x = xRange(1) + (xRange(2) - xRange(1))*rand();
		y = yRange(1) + (yRange(2) - yRange(1))*rand();

		pts = [pts; x y];
	end
end
