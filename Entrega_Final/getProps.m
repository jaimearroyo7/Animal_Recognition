function stats = getProps(filename, annotationname)
    stats = showNFourier(filename,annotationname,20);
    rgb = histo(filename, annotationname);
    stats = cat(1, stats, rgb');
end