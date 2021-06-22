%       Master code for calcium data extraction and analysis
%       Dependencies:
%           Video file (.tif)
%           ROI file (.npz)
%           Code Files: Ca_1_ROI.m , Ca_2_Mask.m

close all
clear all

Sample = 'sample_name';  %Sampe name (not the full file name) 'Experiment_Plate_Microtissue_Day'
VideoFileType = '.tif'; %File type of the timeseries data
ROIFile = strcat(Sample,'.npz'); % roi file name
cr = 3;                 % set the roi pixel radius for marking cells. 10x objectives use a radius of 3;


run('Ca_1_ROI.m')           %Code to identify cell ROI's produced by the python code.

run('Ca_2_Mask')            %Code to overlay a mask on top of the calcium video

%Output = Mask_SampleName.tif

