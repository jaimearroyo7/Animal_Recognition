%% Test Fourier

function stats = showNFourier(imgfile, annotation_file, N)
    % showNFourier('crab/image_0001.jpg','crab/annotation_0001.mat',20)
    contorn = bordeIMG(imgfile,annotation_file);
    %figure(1), imshow(contorn), title('contorn original')
    
    [row, col] = find(contorn,1);
    B = bwtraceboundary(contorn,[row col],'N');
    cdm = mean(B);
    Bc = B-cdm;
    s = Bc(:,1)+i*Bc(:,2);
    %z = fft(s);
    tmp = fft(s);

    %{
    % Comprovació que funciona correctament
    ss = ifft(z);
    files = round(real(ss)+cdm(1));
    columnes = round(imag(ss)+cdm(2));
    aux = (zeros(size(contorn)));
    aux(sub2ind(size(aux),files,columnes)) = 1;
    figure(3), imshow(aux), title('inversa fft')
    %}

    %tmp = z;
    tmp(N+1:end-N) = 0;

    ss2 = ifft(tmp);
    files = round(real(ss2)+cdm(1).*2);
    columnes = round(imag(ss2)+cdm(2).*2);
    aux = zeros(size(contorn).*2);
    aux(sub2ind(size(aux),files,columnes)) = 1;
    %figure(2), imshow(aux), title(sprintf('silueta reconstruida amb N = %d',N));
    stats = regionprops(aux, 'MajorAxisLength','MinorAxisLength', 'Eccentricity', 'Orientation', 'ConvexArea', 'EulerNumber', 'EquivDiameter', 'Solidity', 'Extent', 'Perimeter');
    stats = cell2mat(struct2cell(stats));
end