function min=bisectormethoddif2(f,a1,b1,l)
 syms x
 g=symvar(f);
 f=subs(f,g,x);
 a(1)=a1;
 b(1)=b1;
 k=1;
 df=diff(f,x);
 while abs(b(k)-a(k))>=l
     xk=(a(k)+b(k))/2;
     dfxk=subs(df,x,xk);
     if dfxk==0
         a(k+1)=xk;
         b(k+1)=xk;
     elseif dfxk>0
         a(k+1)=a(k);
         b(k+1)=xk;
     else
         a(k+1)=xk;
         b(k+1)=b(k);
     end
     k=k+1;
 end
 asz=size(a,2);
 bsz=size(b,2);
 min=(b(k)-a(k))/2;
end