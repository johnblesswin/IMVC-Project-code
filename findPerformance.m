function findPerformance(img1, img2, EncryTime, DecryTime)
    img1 = double(img1);
    img2 = double(img2);

    if size(img1) ~= size(img2)
        error('Images must be of the same dimensions.');
    end

    psnrValue = psnr(uint8(img1), uint8(img2));
    [ssimValue, ~] = ssim(uint8(img1), uint8(img2));
    mseValue = immse(img1, img2);
    MAX_I = 255;
    PSNR_calc = 10 * log10((MAX_I^2) / mseValue);
    nccValue = sum(sum((img1 - mean(img1(:))) .* (img2 - mean(img2(:))))) / ...
               (sqrt(sum(sum((img1 - mean(img1(:))).^2))) * sqrt(sum(sum((img2 - mean(img2(:))).^2))));
    maeValue = mean(mean(abs(img1 - img2)));

    fprintf('PSNR: %f dB\n', psnrValue);
    fprintf('Manual PSNR: %f dB\n', PSNR_calc);
    fprintf('SSIM: %f\n', ssimValue);
    fprintf('MSE: %f\n', mseValue);
    fprintf('NCC: %f\n', nccValue);
    fprintf('MAE: %f\n', maeValue);
    fprintf('Encryption Time: %f s\n', EncryTime);
    fprintf('Decryption Time: %f s\n', DecryTime);
end