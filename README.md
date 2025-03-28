# Visual Cryptography with Modular Arithmetic

This MATLAB project demonstrates grayscale image encryption using modular arithmetic combined with visual cryptography techniques.

## 🔐 Encryption
- Formula: `Y = mod(a * X + b, m)`
- Decryption: `X = mod(a_inv * (Y - b), m)`

## 📂 Project Structure

- `main.m`: Main pipeline to run the encryption, decryption and save outputs
- `encrypt_utils.m`: Contains `encrypt` and `decrypt` functions
- `modular_inverse.m`: Finds modular inverse using extended Euclidean algorithm
- `findPerformance.m`: Evaluates PSNR, SSIM, MSE, MAE, NCC, and execution time
- `/images/`: Add your input grayscale secret and cover images here
- `/results/`: Automatically saves output images here

## 🧪 Dependencies
- MATLAB R2020 or higher
- Image Processing Toolbox

## 💻 How to Run

1. Add your input images to the `images/` folder. and give the path in the encryption_module.m
2. Run `main.m`.
3. Check `results/` for the output encrypted and reconstructed images.
4. Review the terminal for performance metrics.
