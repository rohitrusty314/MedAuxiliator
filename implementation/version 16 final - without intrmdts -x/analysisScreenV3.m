function varargout = analysisScreenV3(varargin)
% ANALYSISSCREENV3 MATLAB code for analysisScreenV3.fig
%      ANALYSISSCREENV3, by itself, creates a new ANALYSISSCREENV3 or raises the existing
%      singleton*.
%
%      H = ANALYSISSCREENV3 returns the handle to a new ANALYSISSCREENV3 or the handle to
%      the existing singleton*.
%
%      ANALYSISSCREENV3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSISSCREENV3.M with the given input arguments.
%
%      ANALYSISSCREENV3('Property','Value',...) creates a new ANALYSISSCREENV3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analysisScreenV3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analysisScreenV3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analysisScreenV3

% Last Modified by GUIDE v2.5 05-Mar-2013 16:34:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analysisScreenV3_OpeningFcn, ...
                   'gui_OutputFcn',  @analysisScreenV3_OutputFcn, ...
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

% --- Executes just before analysisScreenV3 is made visible.
function analysisScreenV3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analysisScreenV3 (see VARARGIN)

% Choose default command line output for analysisScreenV3
handles.output = hObject;

load image;

Axes = handles.analysisFrame;
analysis(Axes,originalImage);
% axes(Axes),imshow(originalImage);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analysisScreenV3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = analysisScreenV3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in generateTextreport.
function generateTextreport_Callback(hObject, eventdata, handles)
% hObject    handle to generateTextreport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open('E:\CBIR\implementation\version 12 analysis\Text Reports\Tumor Report1.pdf');
end

% --- Executes on button press in exitButton.
function exitButton_Callback(hObject, eventdata, handles)
% hObject    handle to exitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
end
