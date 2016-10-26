% Derek Wetzel
% Section 021
% Lab 4
%% Part C

clear all;
PIC = imread('Arm_Fracture.jpg');
%PIC = imread('WIN_20150302_130439.JPG');
SIZE = size(PIC);
Pic = 0.299*PIC(:,:,1) + 0.587*PIC(:,:,2) + 0.114*PIC(:,:,3);
%imshow(Pic)
Pic = double(Pic);
[rows, cols, planes] = size(Pic);

NewPic = zeros(rows,cols);
NewPic2 = zeros(rows,cols);
NewPic3 = zeros(rows,cols);
NewPic4 = zeros(rows,cols);
PX = [-1 0 1;-1 0 1;-1 0 1];
PY = [-1 -1 -1;0 0 0;1 1 1];
PD1 = [-1 -1 0;-1 0 1;0 1 1];
PD2 = [0 1 1;-1 0 1;-1 -1 0];
for n = 2:rows-1
    for m = 2:cols-1
       NewPic(n,m) = abs(sum(sum(Pic(n-1:n+1,m-1:m+1).*PX)));
       
       %P2 = abs(sum(sum(Pic(n-1:n+1,m-1:m+1).*PY)));
       %NewPic2(n,m) = P2;
       %P3 = abs(sum(sum(Pic(n-1:n+1,m-1:m+1).*PD1)));
       %NewPic3(n,m) = P3;
       %P4 = abs(sum(sum(Pic(n-1:n+1,m-1:m+1).*PD2)));
       %NewPic4(n,m) = P4;
    end
end
Scale = 255/(max(max(NewPic)));
NewPic = NewPic*min(Scale);
%NewPic2 = NewPic/max(NewPic)*255
%NewPic3 = NewPic/max(NewPic)*255
%NewPic4 = NewPic/max(NewPic)*255
%location1 = find(NewPic < 0);
%NewPic(location1) = 0;
%location2 = find(NewPic > 255);
%NewPic(location2) = 255;
%location3 = find(NewPic2 < 0);
%NewPic2(location3) = 0;
%location4 = find(NewPic2 > 255);
%NewPic2(location4) = 255;
%location5 = find(NewPic3 < 0);
%NewPic3(location5) = 0;
%location6 = find(NewPic3 > 255);
%NewPic3(location6) = 255;
%location7 = find(NewPic4 < 0);
%NewPic4(location7) = 0;
%location8 = find(NewPic4 > 255);
%NewPic4(location8) = 255;

NewImage = uint8(NewPic)
%NewPic2 = uint8(NewPic2)
%NewPic3 = uint8(NewPic3)
%NewPic4 = uint8(NewPic4)
%subplot(2,2,1); 
imshow(NewImage)
title('\bfP_X')
%subplot(2,2,2); imshow(NewPic2)
%title('\bfP_Y')
%subplot(2,2,3); imshow(NewPic3)
%title('\bfP_D1')
%subplot(2,2,4); imshow(NewPic4)
%title('\bfP_D2')

%figure

%Final = Final/max(Final)*255
%location9 = find(Final < 0);
%NewPic(location9) = 0;
%location10 = find(Final > 255);
%NewPic(location10) = 255;
%imshow(Final)