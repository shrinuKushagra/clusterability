function [centroid] = makeDataset()
	K = 3;
	s1 = 2000; c1 = [0.0 0.0]; 
	s2 = 2000; c2 = [8.0 0.0]; 
	s3 = 2000; c3 = [0.0 8.0]; 

	noiseSize = 6000; noiseRange = [-2 10; -2 10];

	nicePt = makeCircle(c1, 1.0, s1);
	nicePt = [nicePt; makeCircle(c2, 1.0, s2)];
	nicePt = [nicePt; makeCircle(c3, 1.0, s3)];
	noisePt = makeNoise(noiseRange(1,:), noiseRange(2,:), noiseSize);

	X = [nicePt; noisePt];
	[class, centroid] = kmeans(X, K);

	plot(nicePt(:,1), nicePt(:,2), '.b');
	hold on;
	plot(noisePt(:,1), noisePt(:,2), '.g');
	plot(centroid(:,1), centroid(:,2), '.xr');
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
