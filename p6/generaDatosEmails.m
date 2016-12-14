function [X, y] = generaDatosEmails(directorio, ncorreos, esSpam, vocablist, vocabulario)
  X = zeros(ncorreos, length(vocablist));
  y = zeros(ncorreos, 1);
  for i=1:ncorreos
    file_name = sprintf("%s/%04d.txt", directorio, i);
    file_contents = readFile(file_name);
    email = processEmail(file_contents);

    while ~isempty(email)
      [str, email] = strtok(email, [' ']);
      if(isfield(vocabulario, str) > 0)
        X(i, vocabulario.(str)) = 1;
      endif 
    endwhile
    y(i) = esSpam;
  endfor
endfunction