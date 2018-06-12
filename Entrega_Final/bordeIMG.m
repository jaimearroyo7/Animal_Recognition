function contorn = bordeIMG(imgfile, annotation_file)
%% 
%% imgfile: string
%% annotation_file: string
%%


IMTYPE = 'jpg'; 
GUIDELINE_MODE = 1; 
%% Parameters 
%label_abbrev = {'LE', 'RE', 'LN', 'NB', 'RN', 'LM', 'RM'}; 
LARGEFONT = 28; 
MEDFONT = 18; 
BIG_WINDOW = get(0,'ScreenSize'); 
SMALL_WINDOW = [100 100 512 480]; 
 
%% load the annotated data
load(annotation_file, 'box_coord', 'obj_contour');

%% Read image 
ima = imread(imgfile); 
   
[filas, cols, ~] = size(ima);
contorn = zeros(filas, cols);
%% show contour
for cc = 1:size(obj_contour,2)
   if cc < size(obj_contour,2)
      contorn = unionPuntos(contorn, [obj_contour(1,cc), obj_contour(1,cc+1)]+box_coord(3), [obj_contour(2,cc), obj_contour(2,cc+1)]+box_coord(1));
      %plot([obj_contour(1,cc), obj_contour(1,cc+1)]+box_coord(3), [obj_contour(2,cc), obj_contour(2,cc+1)]+box_coord(1), 'r','linewidth',4);
   else
       contorn = unionPuntos(contorn, [obj_contour(1,cc), obj_contour(1,1)]+box_coord(3), [obj_contour(2,cc), obj_contour(2,1)]+box_coord(1));
   end
end


 
