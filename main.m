% Updating the VisualCryptography_ModularArithmetic project structure to modularize:
% - main.m will now call three separate modules: encryption_module.m, decryption_module.m, performance_module.m
%- Each module will handle its part and read/write files accordingly

% Define updated file contents
% Author: Dr. John Blesswin A
% Description: Main controller script calling encryption, decryption, and performance modules

clc; clear; close all;

% Parameters
a = 13; b = 19; m = 256;
a_inv = modular_inverse(a, m);

% Step 1: Encryption
[Share1, Share2, Share3, IM1, IM2, IM3, GSM,  C1, C2, C3] = encryption_module(a, b, m);

% Step 2: Decryption
[RGSM, exeEncryption, exeDecryption] = decryption_module(Share1, Share2, Share3, a_inv, b, m, GSM);

% Step 3: Performance Evaluation
performance_module(GSM, RGSM, C1, C2, C3, Share1, Share2, Share3, exeEncryption, exeDecryption);
