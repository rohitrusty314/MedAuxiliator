function varargout = twentysimilarV12(varargin)
% TWENTYSIMILARV12 MATLAB code for twentysimilarV12.fig
%      TWENTYSIMILARV12, by itself, creates a new TWENTYSIMILARV12 or raises the existing
%      singleton*.
%
%      H = TWENTYSIMILARV12 returns the handle to a new TWENTYSIMILARV12 or the handle to
%      the existing singleton*.
%
%      TWENTYSIMILARV12('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TWENTYSIMILARV12.M with the given input arguments.
%
%      TWENTYSIMILARV12('Property','Value',...) creates a new TWENTYSIMILARV12 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before twentysimilarV12_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to twentysimilarV12_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help twentysimilarV12

% Last Modified by GUIDE v2.5 24-Mar-2013 21:00:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @twentysimilarV12_OpeningFcn, ...
                   'gui_OutputFcn',  @twentysimilarV12_OutputFcn, ...
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

% --- Executes just before twentysimilarV12 is made visible.
function twentysimilarV12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to twentysimilarV12 (see VARARGIN)

% Choose default command line output for twentysimilarV12
handles.output = hObject;
handles.fileLoaded = 0;
load gl;
Axes(1) = handles.axes1;
Axes(2) = handles.axes2;
Axes(3) = handles.axes3;
Axes(4) = handles.axes4;
Axes(5) = handles.axes5;
Axes(6) = handles.axes6;
Axes(7) = handles.axes7;
Axes(8) = handles.axes8;
Axes(9) = handles.axes9;
Axes(10) = handles.axes10;
Axes(11) = handles.axes11;
Axes(12) = handles.axes12;
Axes(13) = handles.axes13;
Axes(14) = handles.axes14;
Axes(15) = handles.axes15;
Axes(16) = handles.axes16;
Axes(17) = handles.axes17;
Axes(18) = handles.axes18;
Axes(19) = handles.axes19;
Axes(20) = handles.axes20;

userData.Axes = Axes;
save AxesFile Axes;
for i = 1:numel(Axes)
    axes(Axes(i));
    cla;
    axis off;
end


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

% UIWAIT makes twentysimilarV12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


load IPimageFile;
load AxesFile;
load IFile;


I37 = I1;
save IFile37 I37;

dirPath = strcat(pwd, '\','images jpg','\');
% dirfiles = dir(strcat(dirPath, '*.jpg'));

% I1
k=1;
l = g + 19;
for temp=g:l
    temp
    z = I1(temp,1);
    strIndex = int2str(z);
    
    fullName = strcat(strIndex,'.jpg');
    
    tmp = strcat(dirPath, fullName);
    axes(Axes(k)); cla; imshow(tmp);
    k=k+1;
  
end

end

% --- Outputs from this function are returned to the command line.
function varargout = twentysimilarV12_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load gl;
g = g + 20;

save gl g;
twentysimilarV12();
end