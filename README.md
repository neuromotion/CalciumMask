# CalciumMask
This is MATLAB code to make a mask of cell positions onto a calcium image video.

Run the Ca_Preprocess code to make the mask. This code should be used after identifying the calcium cell body ROI's with the calcium_roi_analysis code. This code will open the .npz file and apply the roi positions to the mask of the video. After running this code, the masked video output (.tif) can be input into the FluoroSNNAP application (Patel, et al, 2015) and segmentation can be performed with simple thresholding.
