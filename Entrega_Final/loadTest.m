function [data, species] = loadTest()
    % Añadimos el directorio de imagenes al path
    folder = fileparts(which(mfilename)); 
    addpath(genpath(folder));
    % Leemos ficheros .jpg del directorio actual y sus subdirectorios

    dirAnterior = ' ';

    animals = ["ant", "beaver", "crab", "crayfish", "crocodile", "dolphin", "dragonfly", "elephant", "emu", "flamingo", "kangaroo", "panda"];

    data = [];  
    species = [];
    for i = 1 : length(animals)
        path = strcat('imatges_animals_80_20\test\', animals(i),'\*.jpg');
        dinfo = dir(path);
        for j = 1 : length(dinfo)
            thisfolder = dinfo(j).folder;	% carpeta del fichero
            thisfilename = dinfo(j).name;	% nombre del fichero
            filename = strcat(thisfolder,'\',thisfilename);
            species = [species,animals(i)];
            %filename
            annotationname = replace(replace(filename,'.jpg','.mat') ,'image','annotation');
            stats = getProps(filename, annotationname);
            data = [data,stats];
        end
    end

    species = categorical(species');
    data = data';
end
