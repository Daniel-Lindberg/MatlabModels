retire = 33;
returnAmt = 1.10;
total = zeros(1,retire);
total(1) = 1000;
yearlyAddition = 2000;
for age = 1:retire
    total(age+1) = total(age)*returnAmt + yearlyAddition;
end
age = 21:retire+21;
plot(age,total);
