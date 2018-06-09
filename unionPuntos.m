function img = unionPuntos(img, X, Y)
    x0 = X(1);
    x1 = X(2);
    y0 = Y(1);
    y1 = Y(2);
    
    if x0 < 1
        x0 = 1;
    end
    if x1 < 1
     x1 = 1;
    end
    if y0 < 1
        y0 = 1;
    end
    if y1 < 1
        y1 = 1;
    end    
    
    img(uint32(y0), uint32(x0)) = 1;
    img(uint32(y1), uint32(x1)) = 1;
    
    degree = atan2(double(y1 - y0), double(x1 - x0));
    D  = sqrt(((x1-x0).^ 2)+((y1-y0).^ 2));
    for i = 1:D
        pointx = uint32(i*cos(degree) + x0);
        pointy = uint32(i*sin(degree) + y0);
        img(pointy, pointx) = 1;
    end
    %bala->setPosition(glm::vec2(3 * cos(baladegree), 3 * sin(baladegree)) + bala->position());
    
end