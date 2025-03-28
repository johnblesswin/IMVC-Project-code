function performance_module(GSM, RGSM, C1, C2, C3, Share1, Share2, Share3, exeEncryption, exeDecryption)
    findPerformance(GSM, RGSM, exeEncryption, exeDecryption);
    findPerformance(C1, Share1, exeEncryption, exeDecryption);
    findPerformance(C2, Share2, exeEncryption, exeDecryption);
    findPerformance(C3, Share3, exeEncryption, exeDecryption);
end