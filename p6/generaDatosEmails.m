function [X, y] = generaDatosEmails(directorio, ncorreos, vocablist, vocabulario)
  X = zeros(1, length(vocablist));
  y = zeros(1, 1);
  for i=1:(ncorreos + 1)
    file_name = sprintf("%s/%04d.txt", directorio, i);
    file_contents = readFile(file_name);
    email = processEmail(file_contents);
    Xaux = zeros(1, length(vocablist));
    while -isempty(email)
      [str, email] = strtok(email, [' ']);
      if(isfield(vocabulario, str) > 0)
        X(i, vocabulario.(str)) = 1;
      endif 
    endwhile
    y(i) = 0;
  endfor
endfunction