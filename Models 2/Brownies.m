Grade = zeros(1,100);
for brownies = 1:100
   if brownies < 20 
       Grade(brownies) = brownies * .1;
   elseif brownies < 40
       Grade(brownies) = brownies * .15;
   elseif brownies < 50 
       Grade(brownies) = brownies * .2;
   elseif brownies < 60
       Grade(brownies) = brownies * .25;
   elseif brownies < 70
       Grade(brownies) = brownies * .3;
   elseif brownies < 80
       Grade(brownies) = brownies * .35;
   elseif brownies < 90
       Grade(brownies) = brownies * .5;
   elseif brownies < 100
       Grade(brownies) = brownies * .75;
   else
       Grade(brownies) = brownies * 1;
   end
end  
   category = 1:100;
   
   plot(category,Grade);