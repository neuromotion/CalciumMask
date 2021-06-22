%Code to extract ROI position from python code

%Dependencies:
%       Must run this code with Ca_Preprocess.m and Ca_2_Mask.m


h = unzip(ROIFile);
i1 = h{1};
i1_data = readNPY(i1);
i2 = h{2};
i2_data =readNPY(i2);

sz = size(i1_data,1);

File2 = strcat(Sample,VideoFileType);
InfoImage=imfinfo(File2,'tif');
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;

roiMasks = [];
for i = 1:sz
    g = i2_data(i);
    if g==1
        c = [i1_data(i,2), i1_data(i,1)];
        roiMasks(:,:,i) = createCirclesMask([nImage mImage],c,cr);
    end
end
totalCells = size(roiMasks,3);
