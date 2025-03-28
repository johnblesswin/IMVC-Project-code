function [Share1, Share2, Share3, IM1, IM2, IM3, GSM,  C1, C2, C3] = encryption_module(a, b, m)
    GSM = imread('images/Input3.bmp');
    C1 = imread('images/Cover1.tif');
    C2 = imread('images/Cover2.tif');
    C3 = imread('images/Cover3.tif');

if size(GSM, 3) == 3
    GSM = rgb2gray(GSM);
end
if size(C1, 3) == 3
    C1 = rgb2gray(C1);
end

if size(C2, 3) == 3
    C2 = rgb2gray(C2);
end

if size(C3, 3) == 3
    C3 = rgb2gray(C3);
end
GSM = imresize(GSM, [512,512]);
[M, N] = size(GSM);
C1 = imresize(C1, [M N]);
C2 = imresize(C2, [M N]);
C3 = imresize(C3, [M N]);

    GSM = double(GSM); 
    C1 = double(C1); 
    C2 = double(C2); 
    C3 = double(C3);

    Share1 = zeros(M,N); Share2 = zeros(M,N); Share3 = zeros(M,N);
    IM1 = zeros(M,N); IM2 = zeros(M,N); IM3 = zeros(M,N);

    tic;
    for i = 1:M
        for j = 1:N
            X = encrypt(GSM(i,j), a, b, m);
            IM1(i,j) = floor(X / 100);
            IM2(i,j) = mod(floor(X / 10), 10);
            IM3(i,j) = mod(X, 10);
            Share1(i,j) = C1(i,j) - mod(C1(i,j),10) + IM1(i,j);
            Share2(i,j) = C2(i,j) - mod(C2(i,j),10) + IM2(i,j);
            Share3(i,j) = C3(i,j) - mod(C3(i,j),10) + IM3(i,j);
        end
    end
    assignin('base','exeEncryption',toc);

    imwrite(uint8(Share1), 'results/Share1.bmp');
    imwrite(uint8(Share2), 'results/Share2.bmp');
    imwrite(uint8(Share3), 'results/Share3.bmp');
    imwrite(uint8(IM1), 'results/IM1.bmp');
    imwrite(uint8(IM2), 'results/IM2.bmp');
    imwrite(uint8(IM3), 'results/IM3.bmp');
    imwrite(uint8(GSM), 'results/GSM.bmp');
end