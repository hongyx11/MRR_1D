function X=genbasisX(x,order)

if order ~= 1
    eleOrder=ones(1,size(x,2))*order;
    m = fullfact(eleOrder)-1;  % all combinations of 0,1,2,3
    m(sum(m,2)>order,:) = [];  % remove ones with order >'order'
    m(sum(m,2)==0,:)=[];
    X = x2fx(x,m); 
    size(X,2)
else
    X = x;
end

end