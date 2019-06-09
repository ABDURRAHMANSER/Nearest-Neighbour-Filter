% this function is implemented Nearest
% Neighbor Filter for recheck the classified image and get
% higher accuracy of the classified image
% Inputs :
%         in_image_path: file path of input image type: str
%         Lower: the Lower thresholds valew       type: int
%         Upper: the Upper thresholds value       type: int
%         Output_image: is the output image iname type: str
% Output:
%        new image with more accurrcy
function [outimage] = Post_calssifiction_Processing_NNF(in_image_path, Lower, Upper, Output_image)
        img= imread(in_image_path) ;
        [row, col] = size(img);
        outimage =uint8( zeros(row, col));
        for row_pi =2  : row-1
            for col_pi =2  : col-1
                    % my karnel of the nieghboor pixel.
                    mask = [ img(row_pi, col_pi)         , img(row_pi, col_pi + 1), img(row_pi, col_pi - 1),...
                             img(row_pi + 1, col_pi + 1) , img(row_pi+1,col_pi)   , img(row_pi+1,col_pi+1),...
                             img(row_pi - 1,col_pi - 1)  , img(row_pi - 1, col_pi), img(row_pi - 1, col_pi + 1)] ;
                    % chekc if the mideal pixel exist in my mask
                    check_mask = mask;
                    check_mask(1) = [] ;
                    check = sum(check_mask(:) == mask(1,1)) ; % set the lawer threshold
                    if check < Lower && sum(check_mask(:) == mode(mask)) > Upper  ;
                        % put the mode value in the midal of karnel
                        outimage(row_pi, col_pi) =  mode(mask);
                    else
                       outimage(row_pi, col_pi) =  mask(1,1) ;
                    end
            end
        end
        %save the image
        imshow(outimage,[]);
        imwrite(outimage, Output_image) ;
end