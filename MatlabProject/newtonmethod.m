function xk=newtonmethod(f,xs,e,gama,abc)
  %abc: 1->σταθερό γ, 2->ελαχιστοποιηση f(xk+γ*d), 3->μέθοδος Armijo
  syms x y gbest
  g=symvar(f);
  f=subs(f,g,g);
  grad=gradient(f);
  gradf=grad(x,y); %βάζουμε το gradient σε πίνακα για να κάνουμε πράξεις
  xk(1,:)=xs;  %ξεκινάμε με xs=(x,y)
  k=1;
  gradfxk=subs(gradf,g,xk(1,:));
  hessf=hessian(f,g);
  hf=hessf(x,y);
  maxk=50; %Για πάνω από maxk επαναλήψεις, βγες από την μέθοδο
  while e<=norm(gradfxk) && k<=maxk%Αν ε<=|gradient(f(xk))| συνεχίζει το loop
      hessfxk=subs(hf,g,xk(k,:));
      dk=-inv(hessfxk)*gradfxk; %δκ=-inverse(hessian(f(xk)))gradient(f(xk)
      d=double(dk);
      if abc==1
          gk(k)=gama;
      elseif abc==2
          xkk(gbest)=xk(k,:)-gbest.*transpose(d);
          xkk1=xkk(gbest);
          fmin1(y)=subs(f,x,xkk1(1,1));
          fmin2(gbest)=subs(fmin1,y,xkk1(1,2));
          fmin3=fmin2(gbest);
          glow=0.1;
          gup=10;
          l=0.1;
          gk(k)=bisectormethoddif2(fmin3,glow,gup,l);
      elseif abc==3 && k==1
          s=gama;  %αρχικό βήμα
          gk(k)=s;
      elseif abc==3 && k~=1
          fxkplus1=subs(f,g,xk(k,:)); %f(x(k+1))
          fxk1=subs(f,g,xk(k-1,:)); %f(x(k))
          a=[10^(-5) 10^(-4) 10^(-3) 10^(-2) 10^(-1)];
          b=[1/10 1/8 1/6 1/4 1/2];
          idxa=1;
          idxb=1;
          mk=1;
          repetitioncounter=0;
          maxrepeat=15;
          while fxk1-fxkplus1<a(idxa).*b(idxb)^mk.*s.*transpose(d)*gradfxk
              mk=mk+1; 
              %Αν φτάσουμε στο μέγιστο όριο επαναλήψεων δοκιμάζουμε άλλο α
              %για ίδιο β
              if repetitioncounter==maxrepeat && idxa~=size(a,1) 
                  idxa=idxa+1;
                  repetitioncounter=0;
              %Όταν δοκιμάσουμε όλα τα α για ένα β επαναλαμβάνουμε τη
              %διαδικασία για το επόμενο β
              elseif repetitioncounter==maxrepeat && idxa==size(a,1)
                  idxb=idxb+1;  
                  idxa=1;
                  repetitioncounter=0;
              end
              repetitioncounter=repetitioncounter+1;
          end
          gk(k)=s*b(idxb)^mk;
      end
      xk(k+1,:)=xk(k,:)+gk(k).*transpose(d);
      k=k+1;
      gradfxk=subs(gradf,g,xk(k,:));
      if k==maxk
          if abc==1
            fprintf('Πολλές επαναλήψεις-> Η μέθοδος δεν συγκλίνει(ή συγκλίνει πολύ αργά) για γ=%d\n', gama)
          else
            fprintf('Πολλές επαναλήψεις-> Η μέθοδος δεν συγκλίνει(ή συγκλίνει πολύ αργά)')
          end
  end
end