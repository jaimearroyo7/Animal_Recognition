function councountLegs( img_file,annotation_file )
    % Función que cuenta la cantidad de patas de un animal
    
    contorn = bordeIMG(img_file,annotation_file);
    
    % Obtenemos la forma del animal (blanco forma, negro fondo)
    BW = expand(contorn,1,1);
    BW = imcomplement(BW);
    figure(1), imshow(BW)
    
    % Separamos las patas del cuerpo
    ee = strel('disk',15);
    op = imopen(BW,ee);
    figure(2), imshow(op), title('open')
    res = BW-op;
    figure(3), imshow(res), title('potes')
    
    % Traiem zones petites que siguin soroll
    res = bwareaopen(res,100);
    figure(4), imshow(res), title('potes netes')
    
    % Contamos los componentes conexos y guardamos la cantidad
    CC = bwconncomp(res);
    num_potes = CC.NumObjects
end

