function clasificador = createClassificator()

    %% Script per executar els fitxers tots seguits
    % Añadimos el directorio de imagenes al path
    folder = fileparts(which(mfilename)); 
    addpath(genpath(folder));
    % Leemos ficheros .jpg del directorio actual y sus subdirectorios

    dirAnterior = ' ';

    animals = ["ant", "beaver", "crab", "crayfish", "crocodile", "dolphin", "dragonfly", "elephant", "emu", "flamingo", "kangaroo", "panda"];

    data = [];  
    index = 1;
    species = [];
    for i = 1 : length(animals)
        path = strcat('imatges_test\', animals(i),'\*.jpg');
        dinfo = dir(path);
        for j = 1 : length(dinfo)
            thisfolder = dinfo(j).folder;	% carpeta del fichero
            thisfilename = dinfo(j).name;	% nombre del fichero
            filename = strcat(thisfolder,'\',thisfilename);
            species = [species,animals(i)];
            %filename
            annotationname = replace(replace(filename,'.jpg','.mat') ,'image','annotation');
            stats = showNFourier(filename,annotationname,20);
            rgb = histo(filename, annotationname);
            stats = cat(1,stats,rgb');
            data = [data,stats];
            index = index + 1;
        end
    end

    species = categorical(species');
    labels = categories(species);
    data = data';
    clasificador = fitctree(data, species);
end
