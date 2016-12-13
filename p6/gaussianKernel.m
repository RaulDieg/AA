function sim = gaussianKernel(x1, x2, sigma)
  sumatorio = sum((x1 - x2) .^ 2);
  sim = exp(-((sumatorio)/(2 * (sigma ^ 2))));
end function