function varargout = LoadQueryV3(varargin)
% LOADQUERYV3 MATLAB code for LoadQueryV3.fig
%      LOADQUERYV3, by itself, creates a new LOADQUERYV3 or raises the existing
%      singleton*.
%
%      H = LOADQUERYV3 returns the handle to a new LOADQUERYV3 or the handle to
%      the existing singleton*.
%
%      LOADQUERYV3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOADQUERYV3.M with the given input arguments.
%
%      LOADQUERYV3('Property','Value',...) creates a new LOADQUERYV3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LoadQueryV3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LoadQueryV3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LoadQueryV3

% Last Modified by GUIDE v2.5 13-Feb-2013 13:18:37


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LoadQueryV3_OpeningFcn, ...
                   'gui_OutputFcn',  @LoadQueryV3_OutputFcn, ...
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

% --- Executes just before LoadQueryV3 is made visible.
function LoadQueryV3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LoadQueryV3 (see VARARGIN)

% Choose default command line output for LoadQueryV3
handles.output = hObject;


global flag
flag = 0;

% flag


 %back ground image for the user interface
 ha = axes('units','normalized', ... 
     'position',[0 0 1 1]);
 
 % Move the background axes to the bottom
 uistack(ha,'bottom');
 
 % Load in a background image and display it using the correct scale
 I=imread('./bg.jpg');
 I= imagesc(I);
 
 % Turn the handlevisibility off so that we don't inadvertently plot into the axes again
 % Also, make the axes invisible
 set(ha,'handlevisibility','off', ...
     'visible','off');
 set(I,'alphadata',1);
%  handles.userData = userData;




% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LoadQueryV3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = LoadQueryV3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in loadImageBtn.
function loadImageBtn_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global flag;

[FILENAME,PATHNAME] = uigetfile('*.*','Load the query image:');

if(FILENAME == 0)
    flag = 0;
    msgbox('Select image','Error','warn');
    return;
end

[a,b,Ext] = fileparts(FILENAME);
availableExt = {'.jpg','.jpeg'};
found=0;
for (i=1:length(availableExt))
   if(strcmpi(Ext,availableExt(i)))
       found=1;
       break
   end
end

if(found==0)
    msgbox('Load a .jpg/.jpeg Image only','Error','Warn');
    return;
end

queryImage = imread([PATHNAME FILENAME]);
flag = 1;
originalImage = rgb2gray(queryImage);
axes(handles.queryImageAxis);
imshow(originalImage);
% size(originalImage)
save image originalImage;
guidata(hObject, handles);
% flag

save path PATHNAME;
end

% --- Executes on button press in enhanceImageBtn.
function enhanceImageBtn_Callback(hObject, eventdata, handles)
% hObject    handle to enhanceImageBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global flag;
load image;
% flag
if(flag==0)    
    msgbox('NO IMAGE TO ENHANCE','Error','Warn');
    return;
end
close;

    
enhancedImageV3(originalImage);
end
