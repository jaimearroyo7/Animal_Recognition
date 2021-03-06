function clasificador = createClassificator()

    %% Script per executar els fitxers tots seguits
    % A�adimos el directorio de imagenes al path
    folder = fileparts(which(mfilename)); 
    addpath(genpath(folder));
    % Leemos ficheros .jpg del directorio actual y sus subdirectorios

    dirAnterior = ' ';

    %animals = ["ant", "beaver", "crab", "crayfish", "crocodile", "dolphin", "dragonfly", "elephant", "emu", "flamingo", "kangaroo", "panda"];
    animals = [string('ant'), string('beaver'), string('crab'), string('crayfish'), string('crocodile'), string('dolphin'), string('dragonfly'), string('elephant'), string('emu'), string('flamingo'), string('kangaroo'), string('panda')];

    data = [];  
    species = [];
    for i = 1 : length(animals)
        path = strcat('imatges_animals_80_20\entreno\', animals(i),'\*.jpg');
        dinfo = dir(char(path));
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
    labels = categories(species);
    data = data';
    clasificador = fitctree(data, species);
end
