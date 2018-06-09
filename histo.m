function rgb = histo(filename, annotation_file)
    im = imread(filename);
    [a,b, dim] = size(im);
    load(annotation_file, 'box_coord', 'obj_contour');
    %box_coord
    im = im(box_coord(1):box_coord(2), box_coord(3):box_coord(4), :);
    num = (box_coord(2)-box_coord(1)) .* (box_coord(4)-box_coord(3));
    
    if dim == 1
        rgb(1) = sum(sum(im(:,:,1)))./num;
        rgb(2) = rgb(1);
        rgb(3) = rgb(1);
    else
        rgb(1) = sum(sum(im(:,:,1)))./num;
        rgb(2) = sum(sum(im(:,:,2)))./num;
        rgb(3) = sum(sum(im(:,:,3)))./num;
    end
end