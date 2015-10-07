function [X] = makeDataset(noiseRadius, noiseSize)
	K = 2;
	s = [2000 2000];
	c = [0.0 0.0; 8.0 0.0];

	%noiseSize = 5000; noiseRange = [1 7; -1 1];
	noiseC = [4.0 3.0; 5.0 3.0; 6.0 3.0; 7.0 3.0; 8.0 3.0; 9.0 3.0];
	noiseC = [noiseC; 4.0 -6.0; 5.0 -6.0; 6.0 -6.0; 7.0 -6.0; 8.0 -6.0; 9.0 -6.0];
	
	nicePt = makeCircle(c(1, :), 1.0, s(1));
	nicePt = [nicePt; makeCircle(c(2, :), 1.0, s(2))];
	%nicePt = [nicePt; makeCircle(c(3, :), 1.0, s(3))];
	%noisePt = makeRectangle(noiseRange(1, :), noiseRange(2, :), noiseSize);
	
	noisePt = makeCircle(noiseC(1, :), noiseRadius, noiseSize);
	noisePt = [noisePt; makeCircle(noiseC(2, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(3, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(4, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(5, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(6, :), noiseRadius, noiseSize)];

	noisePt = [noisePt; makeCircle(noiseC(7, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(8, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(9, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(10, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(11, :), noiseRadius, noiseSize)];
	noisePt = [noisePt; makeCircle(noiseC(12, :), noiseRadius, noiseSize)];

	X = [nicePt; noisePt];
	%y = [ones(s(1), 1); 2*ones(s(2), 1); 3*ones(s(3), 1)];
	%[class, centroid] = kmeans(X, K);

	plot(nicePt(:,1), nicePt(:,2), '.b');
	hold on;
	%plot(centroid(:,1), centroid(:,2), 'ok');
	plot(noisePt(:,1), noisePt(:,2), '.g');
	%plot(c(:,1), c(:,2), '.ob');
	hold off;
end

function [pts] = makeCircle(center, radius, noPoints)
	pts = [];
	for i = 1:noPoints
		r = radius*rand();
		theta = 2*pi*rand();

		pts = [pts; center(1)+r*cos(theta) center(2)+r*sin(theta)];
	end
end

function [pts] = makeRectangle(xRange, yRange, noPoints)
	pts = [];
	for i = 1:noPoints
		x = xRange(1) + (xRange(2) - xRange(1))*rand();
		y = yRange(1) + (yRange(2) - yRange(1))*rand();

		pts = [pts; x y];
	end
end
