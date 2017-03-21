function varargout = exc6(varargin)
% EXC6 MATLAB code for exc6.fig
%      EXC6, by itself, creates a new EXC6 or raises the existing
%      singleton*.
%
%      H = EXC6 returns the handle to a new EXC6 or the handle to
%      the existing singleton*.
%
%      EXC6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXC6.M with the given input arguments.
%
%      EXC6('Property','Value',...) creates a new EXC6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exc6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exc6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exc6

% Last Modified by GUIDE v2.5 06-Aug-2012 13:07:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exc6_OpeningFcn, ...
                   'gui_OutputFcn',  @exc6_OutputFcn, ...
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

% --- Executes just before exc6 is made visible.
function exc6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exc6 (see VARARGIN)

% Choose default command line output for exc6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exc6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = exc6_OutputFcn(hObject, eventdata, handles) 
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
global Img;
  [FileName,PathName] = uigetfile({'*.*'},'Load jpg Image File');

 
if (FileName==0)
    % if user not selects the image from db then show warning messsage
    msgbox('select the image form the image database','Error','warn');
    return;
end
  Img=imread([PathName FileName]);
 
axes(handles.axes1)
imshow(Img);


end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  global Img;
   img1=rgb2gray(Img);
   ed=edge(img1,'canny');
   axes(handles.axes2);
   imshow(ed);
end
