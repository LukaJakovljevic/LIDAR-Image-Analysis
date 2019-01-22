close all
clear all
clc

%% Original
close all
clear all
clc

%ucitavanje slike
img = imread('quicklook1_crop.bmp');
imshow(img);
title('Originalna slika')

%% RGB

red = img(:,:,1); % Crvena komponenta
green = img(:,:,2); % Zelena komponenta
blue = img(:,:,3); % Plava komponenta
a = zeros(size(img, 1), size(img, 2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);
figure, 
subplot(2,2,1), imshow(img), title('Originalna slika')
subplot(2,2,2), imshow(just_red), title('Crvena komponenta')
subplot(2,2,3), imshow(just_green), title('Zelena komponenta')
subplot(2,2,4), imshow(just_blue), title('Plava komponenta')

% Popravljanje kontrasta crvene pomocu imadjust
I1=imadjust(red,stretchlim(red));
I2=imadjust(red,[.75 1],[]);
just_red_1 = cat(3, I1, a, a);
just_red_2 = cat(3, I2, a, a);

%iscrtavanje crvenih slika i histograma
figure;
subplot(2,3,1); subimage(just_red); title('Crvena')
subplot(2,3,4); imhist(red); title('Crvena histogram');
subplot(2,3,2); subimage(just_red_1); title('Crvena stretchlim');
subplot(2,3,5); imhist(I1); title('Crvena Hist stretchlim');
subplot(2,3,3); subimage(just_red_2); title('Crvena [0.75 1]')
subplot(2,3,6); imhist(I2); title('Crvena Hist [0.75 1]');

%% Intenzitetska

%Intenzitetska
int=rgb2gray(img);

% Popravljanje kontrasta pomocu imadjust
I1=imadjust(int,stretchlim(int));

%iscrtavanje novih slika i histograma
figure;
subplot(2,2,1); subimage(int); title('Int')
subplot(2,2,3); imhist(int,256); title('Int histogram');
subplot(2,2,2); subimage(I1); title('Int: stretchlim')
subplot(2,2,4); imhist(I1); title('Int histogram novi');

%% HSV

%HSV -> Hue
hsv=rgb2hsv(img);
hue=hsv(:,:,1);

% Popravljanje kontrasta pomocu imadjust
I1=imadjust(hue,stretchlim(hue));

%iscrtavanje novih slika i histograma
figure;
subplot(2,2,1); subimage(hue); title('Hue')
subplot(2,2,3); imhist(hue,256); title('Hue histogram');
subplot(2,2,2); subimage(I1); title('Hue: stretchlim')
subplot(2,2,4); imhist(I1); title('Hue histogram novi');