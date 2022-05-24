clc
clear all
close all
filename=['E:\Users\ASUS\Pictures\Camera Roll\6.jpg'];
filename_ace=['E:\Users\ASUS\Pictures\Camera Roll\6_dark.png'];
Im=imread(filename);
I=double(Im)/255; 
[m,n]=size(I,1,2);
subplot(1,2,1);
imshow(I,[]);title('原始 image')
w0=0.95;
wh=3;
%% dark_channel
I1=zeros(m,n);
for i=1:m
    for j=1:n
        I1(i,j)=min(I(i,j,:));
    end
end
Id = ordfilt2(I1,1,ones(wh,wh),'symmetric');
%%  A
dark_channel = Id;
A_temp = max(max(dark_channel))*0.999;
A=A_temp;
tr= 1 - w0 * Id/ A;
%% out 
t0=0.1;
t1 = max(t0,tr);
I_out=zeros(m,n,3);
for k=1:3
    for i=1:m
        for j=1:n
            I_out(i,j,k)=(I(i,j,k)-A)/t1(i,j)+A;
        end
    end
end
subplot(1,2,2);
imshow(I_out,[]);
title('Improved image')
imwrite(I_out,filename_ace);