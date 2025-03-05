clc
clf
%Creating f
syms f(x,y) 
f(x,y) = x^3*exp(-x^2-y^4);
figure(1)
fmesh(f) %(1ο θέμα)

%Από την γενική εικόνα της f έχουμε
zmin=-0.409; %zmin=~0.409
xmin=-1.25; %x=~1.25 στο ελάχιστο της f
ymin=-0.03; %y=~-0.03 στο ελάχιστο της f

xstart=[0 0; -1 -1; 1 1];


%α ερώτημα (σταθερό γ)
gama=[0.2 1 3 6 8];
e=0.005;

%Steepest decent method (2ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
  fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
  for j=1:size(gama,2)
    fprintf('%d) γ=%d\n', j,gama(j)) 
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xa2=steepestdecentmethod(f,xstart(i,:),e,gama(1,j),1);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowa2=size(xa2,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xna2=xa2(szrowa2,1);
    yna2=xa2(szrowa2,2);
    zna2=double(f(xna2,yna2));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xna2,yna2,zna2,szrowa2)
    
    %{
    % -------------αποτύπωση για κάθε γ ξεχωριστά με xk, yk μαζί-----------------%
    figure(1+j+(i-1)*size(gama,2)) 
    title2=append('Steepestdecent:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για γ=' ,num2str(gama(j)));
    title(title2)
    hold on
    plot(xa2(:,1))
    plot(xa2(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off
  end 
  fprintf('\n')
    %}

    %----------------------αποτύπωση για όλα τα γ μαζί με xk, yk ξεχωριστά------------------%

  %%{  
    figure(2*i)  %Για το χκ
    title2=append('Steepestdecent:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title2)
    hold on
    plot(xa2(:,1), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('xk')
    hold off
    
    figure(2*i+1) %Για το yκ
    title2=append('Steepestdecent:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title2)
    hold on
    plot(xa2(:,2), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('yk')
    hold off    
  end 
  fprintf('\n')
  figure(2*i)
  yline(xmin, '--', 'DisplayName', sprintf('expected x=%s', num2str(xmin)))
  figure(2*i+1)
  yline(ymin, '--', 'DisplayName', sprintf('expected y=%s', num2str(ymin)))
  %%}
end 


%Newton method (3ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
  fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
  for j=1:size(gama,2)
    fprintf('%d) γ=%d\n', j,gama(j)) 
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xa3=newtonmethod(f,xstart(i,:),e,gama(1,j),1);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowa3=size(xa3,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xna3=xa3(szrowa3,1);
    yna3=xa3(szrowa3,2);
    zna3=double(f(xna3,yna3));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xna3,yna3,zna3,szrowa3)

    %{
    % -------------αποτύπωση για κάθε γ ξεχωριστά με xk, yk μαζί-----------------%
    figure(16+j+(i-1)*size(gama,2))  
    title3=append('Newton:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για γ=' ,num2str(gama(j)));
    title(title3)
    hold on
    plot(xa3(:,1))
    plot(xa3(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off
  end 
  fprintf('\n')
    %}

    %----------------------αποτύπωση για όλα τα γ μαζί με xk, yk ξεχωριστά------------------%

  %%{  
    figure(6+2*i)  %Για το χκ
    title3=append('Newton:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title3)
    hold on
    plot(xa3(:,1), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('xk')
    hold off
    
    figure(7+2*i) %Για το yκ
    title3=append('Newton:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title3)
    hold on
    plot(xa3(:,2), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('yk')
    hold off    
  end 
  fprintf('\n')
  figure(6+2*i)
  yline(xmin, '--', 'DisplayName', sprintf('expected x=%s', num2str(xmin)))
  figure(7+2*i)
  yline(ymin, '--', 'DisplayName', sprintf('expected y=%s', num2str(ymin)))
  %%}
end 

%Levenberg-Marquadt method (4ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
  fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
  for j=1:size(gama,2)
    fprintf('%d) γ=%d\n', j,gama(j)) 
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xa4=levenbergmarquardtmethod(f,xstart(i,:),e,gama(1,j),1);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowa4=size(xa4,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xna4=xa4(szrowa4,1);
    yna4=xa4(szrowa4,2);
    zna4=double(f(xna4,yna4));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xna4,yna4,zna4,szrowa4)

    
    % -------------αποτύπωση για κάθε γ ξεχωριστά με xk, yk μαζί-----------------%
  %{
    figure(31+j+(i-1)*size(gama,2)) 
    title4=append('Levenberg-Marquadt:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για γ=' ,num2str(gama(j)));
    title(title4)
    hold on
    plot(xa4(:,1))
    plot(xa4(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off
  end 
  fprintf('\n')
  %}

    %----------------------αποτύπωση για όλα τα γ μαζί με xk, yk ξεχωριστά------------------%

  %%{  
    figure(12+2*i)  %Για το χκ
    title4=append('Levenberg-Marquadt:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title4)
    hold on
    plot(xa4(:,1), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('xk')
    hold off
    
    figure(13+2*i) %Για το yκ
    title4=append('Levenberg-Marquadt:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ') για όλα τα γ');
    title(title4)
    hold on
    plot(xa4(:,2), 'DisplayName', sprintf('γ= %d',gama(j)))
    legend()
    ylabel('yk')
    hold off    
  end 
  fprintf('\n')
  figure(12+2*i)
  yline(xmin, '--', 'DisplayName', sprintf('expected x=%s', num2str(xmin)))
  figure(13+2*i)
  yline(ymin, '--', 'DisplayName', sprintf('expected y=%s', num2str(ymin)))
  %%}
end 


%β ερώτημα (μέθοδος εσωτερικής ελαχιστοποίησης γ)

%Steepest decent method (2ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xb2=steepestdecentmethod(f,xstart(i,:),e,1,2);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowb2=size(xb2,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnb2=xb2(szrowb2,1);
    ynb2=xb2(szrowb2,2);
    znb2=double(f(xnb2,ynb2));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnb2,ynb2,znb2,szrowb2)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(19+i) 
    title2=append('Steepestdecent:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title2)
    hold on
    plot(xb2(:,1))
    plot(xb2(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off

   fprintf('\n')
end 

%Newton method (3ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xb3=newtonmethod(f,xstart(i,:),e,1,2);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowb3=size(xb3,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnb3=xb3(szrowb3,1);
    ynb3=xb3(szrowb3,2);
    znb3=double(f(xnb3,ynb3));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnb3,ynb3,znb3,szrowb3)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(22+i) 
    title3=append('Newton:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title3)
    hold on
    plot(xb3(:,1))
    plot(xb3(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off

    fprintf('\n')
end 

%Levenberg-Marquadt method (4ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xb4=levenbergmarquardtmethod(f,xstart(i,:),e,1,2);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowb4=size(xb4,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnb4=xb4(szrowb4,1);
    ynb4=xb4(szrowb4,2);
    znb4=double(f(xnb4,ynb4));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnb4,ynb4,znb4,szrowb4)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(25+i) 
    title4=append('Levenberg-Marquadt:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title4)
    hold on
    plot(xb4(:,1))
    plot(xb4(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off
    fprintf('\n')
end 



%γ ερώτημα (μέθοδος Armijo για τπ γ)

%Steepest decent method (2ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xc2=steepestdecentmethod(f,xstart(i,:),e,1,3);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowc2=size(xc2,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnc2=xc2(szrowc2,1);
    ync2=xc2(szrowc2,2);
    znc2=double(f(xnc2,ync2));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnc2,ync2,znc2,szrowc2)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(28+i) 
    title2=append('Steepestdecent:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title2)
    hold on
    plot(xc2(:,1))
    plot(xc2(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off

   fprintf('\n')
end 

%Newton method (3ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xc3=newtonmethod(f,xstart(i,:),e,1,3);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowc3=size(xc3,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnc3=xc3(szrowc3,1);
    ync3=xc3(szrowc3,2);
    znc3=double(f(xnc3,ync3));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnc3,ync3,znc3,szrowc3)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(31+i) 
    title3=append('Newton:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title3)
    hold on
    plot(xc3(:,1))
    plot(xc3(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off

   fprintf('\n')
end 

%Levenberg-Marquadt method (4ο θέμα)
fprintf('Επιθυμητό x=%f y=%f fmin(x,y)=%f\n', xmin, ymin, zmin)
for i=1:size(xstart,1)
    fprintf('Αρχικό x,y: (%d,%d)\n', xstart(i,1), xstart(i,2))
    %Για κάθε γ,κάθε επανάληψη και κάθε αρχικό σημείο βρίσκουμε κάθε x,y 
    xc4=levenbergmarquardtmethod(f,xstart(i,:),e,1,3);
    %Βρίσκουμε τον αριθμό των στηλών του x,y (αριθμός επαναλήψεων)
    szrowc4=size(xc4,1);
    %Βρίσκουμε τα τελικά x,y και την τιμή της f σε αυτά
    xnc4=xc4(szrowc4,1);
    ync4=xc4(szrowc4,2);
    znc4=double(f(xnc4,ync4));
    fprintf('Τελικά: x=%f y=%f f(x,y)=%f μετά από %d επαναλήψεις\n ', xnc4,ync4,znc4,szrowc4)
    
    % -------------αποτύπωση για κάθε xk, yk μαζί-----------------%
    figure(34+i) 
    title4=append('Levenberg-Marquadt:Αρχικό x,y:(', num2str(xstart(i,1)) ,',', num2str(xstart(i,2)), ')');
    title(title4)
    hold on
    plot(xc4(:,1))
    plot(xc4(:,2))
    yline(xmin, '--')
    yline(zmin)
    legend("xk","yk", "expected x", "expected y")
    hold off

   fprintf('\n')
end 

