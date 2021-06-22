close all

%Code to make a masked video based on ROI position

%Dependencies:
%       Must run this code with Ca_Preprocess.m and Ca_1_ROI.m

File2 = strcat(Sample,VideoFileType);

InfoImage=imfinfo(File2);
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;
NumberImages=length(InfoImage);
FinalImage=zeros(nImage,mImage,NumberImages,'uint16');
slices = NumberImages;
baselineRange = slices;
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
    'Message','Loading Video Data');
%Load the video
for i=1:NumberImages
    h =imread(File2,'Index',i,'Info',InfoImage);
    FinalImage(:,:,i)= h;
    d.Value = i/slices;
    d.Message = 'Loading Video Data';
    drawnow;
end

currentTime = [];
ROI= [];
Mask_Stack = [];
ROI = sum(roiMasks,3);
ROI = ROI>0;
outputfile = strcat("Mask_", Sample, ".tif");

%Overlay the mask onto each video frame
for t=1:slices
    I= FinalImage(:,:,t);
    
    d.Value = t/slices;
    d.Message = 'Making Ca Mask';
    drawnow;
    currentROI = bsxfun(@times,I, cast(ROI, class(I)));
    Mask_Stack(:,:,t)= currentROI;
    if t ==1
        imwrite(currentROI,outputfile, 'tif')
    end
    if t>1
        imwrite(currentROI,outputfile, 'tif','WriteMode','append');
    end
    
end

delete(f);

 