function [ O, O2 ,DzDw ] = betaorg( I1, I2, gamma, DzDy1,DzDy2, DzDy3  )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%前向传播
if nargin == 3  
    
   O = gamma * (I1 - I2 ) ;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%反向传播
if nargin ==6
    DzDy = DzDy1 + DzDy2 +DzDy3;
  
    O = gamma * DzDy ;
    O2 = -O ;
    temp = I1 - I2;
    
    Rtemp = real(temp);
    Itemp = imag(temp);
    
    DzDy_R = real(DzDy);
    DzDy_I = imag(DzDy);
    RDzDw =  DzDy_R(:)' * Rtemp(:);
    IDzDw =  DzDy_I(:)' * Itemp(:);
    DzDw = RDzDw + IDzDw;
   
   
end


end

