function animal = adivina(filename, annotationname)
    stats = getProps(filename, annotationname);
    stats = stats';
    load clasificador.mat;
    animal = predict(cl, stats);
end