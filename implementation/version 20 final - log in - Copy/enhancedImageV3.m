function varargout = enhancedImageV3(varargin)
% ENHANCEDIMAGEV3 MATLAB code for enhancedImageV3.fig
%      ENHANCEDIMAGEV3, by itself, creates a new ENHANCEDIMAGEV3 or raises the existing
%      singleton*.
%
%      H = ENHANCEDIMAGEV3 returns the handle to a new ENHANCEDIMAGEV3 or the handle to
%      the existing singleton*.
%
%      ENHANCEDIMAGEV3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENHANCEDIMAGEV3.M with the given input arguments.
%
%      ENHANCEDIMAGEV3('Property','Value',...) creates a new ENHANCEDIMAGEV3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before enhancedImageV3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to enhancedImageV3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help enhancedImageV3

% Last Modified by GUIDE v2.5 13-Feb-2013 17:03:54

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @enhancedImageV3_OpeningFcn, ...
                   'gui_OutputFcn',  @enhancedImageV3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before enhancedImageV3 is made visible.
function enhancedImageV3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to enhancedImageV3 (see VARARGIN)

% Choose default command line output for enhancedImageV3
handles.output = hObject;

%back ground image for the user interface
 ha = axes('units','normalized','position',[0 0 1 1]);
 
 % Move the background axes to the bottom
 uistack(ha,'bottom');
 
 % Load in a background image and display it using the correct scale
 I=imread('./bg.jpg');
 I= imagesc(I);
 
 % Turn the handlevisibility off so that we don't inadvertently plot into the axes again
 % Also, make the axes invisible
 set(ha,'handlevisibility','off','visible','off');
 set(I,'alphadata',1);

% Update handles structure
guidata(hObject, handles);
 
 load image;            %load original query image
 axes(handles.originalImageAxis);
 imshow(originalImage);       % display original query image
 
 [enhancedImage] = enhance(originalImage);   % enhance query image
 
 axes(handles.enhancedImageAxis);
 imshow(enhancedImage);          % show enhanced image

 
[resampledImage] = resampling(enhancedImage);      % resmaple the image on hexagonal grid
save REimageFile resampledImage;                % save resampled image fror later usage

  
[gaborOutputImage] = edgeDetection(resampledImage);    % apply Gabor filter 

[edgeDetectedImage] = cannyImp(gaborOutputImage);      % generate edgemap
 save edgeImageFile edgeDetectedImage;
 save gaborImageFile gaborOutputImage;
 
% UIWAIT makes enhancedImageV3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = enhancedImageV3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in retrieveButton.
function retrieveButton_Callback(hObject, eventdata, handles)
% hObject    handle to retrieveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


val = get(hObject,'Value');
load edgeImageFile;
load gaborImageFile;

% get the list of of image indidces sorted in order of similarity to the
% query image
I1 = retrieveSimilar(edgeDetectedImage,gaborOutputImage); 
save IFile I1;

similarImageScreenV12();
 
guidata(hObject, handles);
 
end

% --- Executes on button press in analyzeButton.
function analyzeButton_Callback(hObject, eventdata, handles)

% hObject    handle to analyzeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load image;       % original query image
load path;        

% Alert user that the demo is done and give them the option to save an image.
reply = 'No';
if(( size(strfind(PATHNAME,'eT2W_TSE'),1))==1)        %check the series to which the loaded image belongs to
    close all;
    reply = 'Yes';
else
    message = sprintf('The loaded image is not from the eT2W_TSE series.');
    message1 = sprintf('For Analysis, the system needs to load images of eT2W_TSE series.');
    message = sprintf('%s\n\n%s\n\nDo you want to proceed?', message,message1);
    reply = questdlg(message, 'Continue', 'Yes', 'No', 'No');
end
% Note: reply will = '' for Upper right X, 'Yes' for Yes, and 'No' for No.
flag=0;
tumor = 1;
bleed = 2;
infarct = 3;
if strcmpi(reply, 'Yes')           % permission granted to the system to load eT2W_TSE series 
    close all;
    rmg = Untitled4();             % get the corrected path of the eT2W_TSE series image to be read
    rm = imread(rmg);
    et2Image = rgb2gray(rm);
    defectID = classifyDefect(et2Image);   % classifies the defect for, if it falls into tummor or bleed or infarct
     
    %TUMOR
    if(defectID == tumor)        
        tumorPatternMatching(et2Image,1);      %identifies if normal brain image otherwise gives visual indication of the affected region
        load isnormal;
        if(normal==1)
            msgbox('Normal Brain Image');           
        else
            %text report for the located defect
            message = sprintf('\nIndications of Tumor has been found\n\nConsult a doctor immediately!\n\nDo you want to get Text Report?');
            reply = questdlg(message, 'Continue', 'Yes', 'No', 'No')
            if strcmpi(reply, 'Yes')
                
                open('E:\CBIR\implementation\version 20 final - log in - Copy\Text Reports\tumorReport.pdf'); 
            end
        end
    elseif(defectID == bleed)   %BLEED
        
        bleedPatternMatching(et2Image,2);   %identifies if normal brain image otherwise gives visual indication of the affected region
        load isnormal;
        if(normal==1)
            msgbox('Normal Brain Image');           
        else
            messageBleed = sprintf('\nIndications of Bleed has been found\n\nConsult a doctor immediately!\n\nDo you want to get Text Report?');
            reply = questdlg(messageBleed, 'Continue', 'Yes', 'No', 'No');
            % Note: reply will = '' for Upper right X, 'Yes' for Yes, and 'No' for No.
            if strcmpi(reply, 'Yes')
                open('E:\CBIR\implementation\version 20 final - log in - Copy\Text Reports\bleedReport.pdf'); 
            end
        end
    elseif(defectID == infarct)        %INFARCT
        infarctNormalCasePatternMatching(et2Image,3);       %to check if normal or not
        load isnormal;
        if(normal==1)
            msgbox('Normal Brain Image');           
        else
            infarctDetection(et2Image);    %detects the infarct affected regions
            message = sprintf('\nIndications of Infarct has been found\n\nConsult a doctor immediately!\n\nDo you want to get Text Report?');
            reply = questdlg(message, 'Continue', 'Yes', 'No', 'No');
            if strcmpi(reply, 'Yes')
                open('E:\CBIR\implementation\version 20 final - log in - Copy\Text Reports\infarctReport.pdf'); 
            end
        end
    end
       
else
    msgbox('NO Suitable image for Analysis','Error','Warn');
end
end
