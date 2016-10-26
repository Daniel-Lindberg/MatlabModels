clear all;
close all;

test = [2 4 6 8; 4 8 12 6 ; 10 2 16 10];
[rows cols] = size(test);

enlarged = zeros(rows*2 -1,cols*2-1);

for x = 1:rows
    for y = 1:cols
        enlarged(x*2 -1 , y*2 - 1) = test(x,y);
    end
end


for r = 1:rows*2-1
    for c = 1:cols*2-1
        if mod(r,2)== 1 && mod(c,2) == 0 %odd row even column
            enlarged(r,c) = (enlarged(r,c-1) + enlarged(r,c+1))/2;
        elseif mod(r,2) == 0 && mod(c,2) ==1
             enlarged(r,c) = (enlarged(r-1,c) + enlarged(r+1,c))/2;
        elseif mod(r,2) == 0 && mod(c,2) == 0
            enlarged(r,c) = (enlarged(r-1,c-1) + enlarged(r+1,c+1) + enlarged(r+1,c-1) + enlarged(r-1,c+1))/4;
        end
    end
end
enlarged;
Pic = imread('Butterfly.jpg');
figure;
imshow(Pic);
enlarged = double(Pic);
[rows cols third] = size(Pic);

enlarged2 = zeros(rows*2-1,cols*2-1,third);
for x = 1:rows
    for y = 1:cols
        enlarged2(x*2 -1 , y*2 - 1,:) = enlarged(x,y,:);
    end
end

enlarged = enlarged2;

for r = 1:rows*2-1
    for c = 1:cols*2-1
        if mod(r,2)== 1 && mod(c,2) == 0
            enlarged(r,c,:) = (enlarged(r,c-1,:) + enlarged(r,c+1,:))/2;
        elseif mod(r,2) == 0 && mod(c,2) ==1
             enlarged(r,c,:) = (enlarged(r-1,c,:) + enlarged(r+1,c,:))/2;
        elseif mod(r,2) == 0 && mod(c,2) == 0
            enlarged(r,c,:) = (enlarged(r-1,c-1,:) + enlarged(r+1,c+1,:) + enlarged(r+1,c-1,:) + enlarged(r-1,c+1,:))/4;
        end
    end
end





figure;
final = uint8(enlarged);
imshow(final)

