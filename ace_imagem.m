%% Adaptive Contrast Enhancement（ACE）MATLAB Code  Written By bl_Cui
clc;
clear;
close all;
tic;
filename=['E:\Users\ASUS\Pictures\Camera Roll\6.jpg'];
filename_ace=['E:\Users\ASUS\Pictures\Camera Roll\6_ace.png'];
I_raw=imread(filename);  %需为灰度图像，否则使用rgb2gray转为灰度图像或对各个通道单独处理
figure(1)
imshow(I_raw);  
r=I_raw(:,:,1);  
g=I_raw(:,:,2); 
b=I_raw(:,:,3); 
m = 20;     %均值窗口大小(2m+1)*(2m+1)
alpha = 1.5;  %alpha用于控制增益
th = 4;     %th为增益阈值
% 对彩色图像三个通道分别处理
I_r=ACE(r,m,alpha,th);
I_g=ACE(g,m,alpha,th);
I_b=ACE(b,m,alpha,th);

I=cat(3,I_r,I_g,I_b);% 合成彩色图像

figure(2)
imshow(I);
imwrite(I,filename_ace);
toc;


