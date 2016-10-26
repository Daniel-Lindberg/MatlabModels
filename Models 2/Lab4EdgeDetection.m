arm = imread('Arm_Fracture.jpg');
wave = imread('Shockwave.jpg');
butterfly = imread('Butterfly.jpg');

start = arm;
[rows, cols, planes] = size(start);


if  planes >1 
    start = 0.229*start(:,:,1) + 0.587*start(:,:,2) + 0.114*start(:,:,3);
end

pic = double(start);

Filtered_Image = zeros(rows,cols);
Filtered_Image2 = zeros(rows,cols);
Filtered_Image3 = zeros(rows,cols);
Filtered_Image4 = zeros(rows,cols);
Summed_Image = zeros(rows,cols);

Fx = [-1 0 1; -1 0 1; -1 0 1];
Fy = [-1 -1 -1; 0 0 0; 1 1 1];
D1 = [-1 -1 0; -1 0 1; 0 1 1];
D2 = [0 1 1; -1 0 1; -1 -1 0];

for r = 2:(rows-1)
    for c = 2:(cols-1)
        Filtered_Image(r,c) = abs(sum(sum(Fx.*pic(r-1:r+1,c-1:c+1))));
        Filtered_Image2(r,c) = abs(sum(sum(Fy.*pic(r-1:r+1,c-1:c+1))));
        Filtered_Image3(r,c) = abs(sum(sum(D1.*pic(r-1:r+1,c-1:c+1))));
        Filtered_Image4(r,c) = abs(sum(sum(D2.*pic(r-1:r+1,c-1:c+1))));
        Summed_Image(r,c) = ((Filtered_Image(r,c) + Filtered_Image2(r,c) + Filtered_Image3(r,c)+ Filtered_Image4(r,c))/4) ;
    end 
end


scaleRatio1= 255/(max(max(Filtered_Image)));
Filtered_Image=Filtered_Image*scaleRatio1;

scaleRatio2= 255/(max(max(Filtered_Image2)));
Filtered_Image2=Filtered_Image*scaleRatio2;

scaleRatio3= 255/(max(max(Filtered_Image3)));
Filtered_Image3=Filtered_Image*scaleRatio3;

scaleRatio4= 255/(max(max(Filtered_Image4)));
Filtered_Image4=Filtered_Image*scaleRatio4;

scaleRatio5= 255/(max(max(Summed_Image)));
Summed_Image=Summed_Image*scaleRatio5;

figure;

subplot(2,2,1)
final = uint8(Filtered_Image);
imshow(final)
title('Fx');
subplot(2,2,2)
final2 = uint8(Filtered_Image2);
imshow(final2)
title('Fy');
subplot(2,2,3)
final3 = uint8(Filtered_Image3);
imshow(final3)
title('FD1');
subplot(2,2,4)
final4 = uint8(Filtered_Image4);
imshow(final4)
title('FD2');


figure;
finalSummed = uint8(Summed_Image);
imshow(finalSummed)
title('Summed');




