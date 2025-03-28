function [RGSM, exeEncryption, exeDecryption] = decryption_module(Share1, Share2, Share3, a_inv, b, m, GSM)
   
 Share1 = double(Share1);
 Share2 = double(Share2);
 Share3 = double(Share3);

    [M, N] = size(Share1);
    RGSM = zeros(M,N);

    tic;
    for i = 1:M
        for j = 1:N
            Y = mod(Share1(i,j),10)*100 + mod(Share2(i,j),10)*10 + mod(Share3(i,j),10);
            RGSM(i,j) = decrypt(Y, a_inv, b, m);
        end
    end
    exeDecryption = toc;
    exeEncryption = evalin('base','exeEncryption');

    imwrite(uint8(RGSM), 'results/RGSM.bmp');
end