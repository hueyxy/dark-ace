function I=ACE(I,m,alpha,th)%2m+1 * 2m+1大小的块，阈值th,
    [s,t]=size(I);
    M=mean(mean(I));
    %M=std2(I);%可以使用图像的均方根作为M的值
    I_pad=padarray(I,[m,m],'symmetric');%对图像四周进行填充
    I_pad=double(I_pad);
    for i=m+1:s+m
        fprintf("processing: %1.2f\n",i/(s+m));%打印运行进度，1即为完成
        for j=m+1:t+m
             temp=I_pad(i-m:i+m,j-m:j+m);
             ave(i,j)=mean(mean(temp));
             var(i,j)=std2(temp);
             %方案一 ： CG值恒定为2
             %I(i,j)=ave(i,j)+2*(I_pad(i,j)-ave(i,j));
             %方案二 ： CG值可变
             G(i,j)=alpha*M/var(i,j);
             if(G(i,j)>th)
                G(i,j)=th;
             end
             I(i,j)=ave(i,j)+G(i,j)*(I_pad(i,j)-ave(i,j)); 
        end   
    end
    I=I(m+1:s+m,m+1:t+m);
end
