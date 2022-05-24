
%--------------------------------------
clc;
clear;
close all;
 
% -----------图像去雾算法----------------
% 加载图片
filename=['E:\Users\ASUS\Pictures\Camera Roll\1.jpg'];
filename_ace=['E:\Users\ASUS\Pictures\Camera Roll\1_dark.png'];
img = imread(filename);
figure;imshow(img);title('雾图');
% 去雾函数
De_img = anyuanse(img);
figure;imshow(De_img);title('去雾图');
% 输出结果，分辨率300dpi并保存为tiff图片
imwrite(De_img,filename_ace);
