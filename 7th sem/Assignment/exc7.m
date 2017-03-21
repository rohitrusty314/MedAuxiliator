function varargout = exc7(varargin)
% EXC7 MATLAB code for exc7.fig
%      EXC7, by itself, creates a new EXC7 or raises the existing
%      singleton*.
%
%      H = EXC7 returns the handle to a new EXC7 or the handle to
%      the existing singleton*.
%
%      EXC7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXC7.M with the given input arguments.
%
%      EXC7('Property','Value',...) creates a new EXC7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exc7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exc7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exc7

% Last Modified by GUIDE v2.5 06-Aug-2012 14:09:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exc7_OpeningFcn, ...
                   'gui_OutputFcn',  @exc7_OutputFcn, ...
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
% --- Executes just before exc7 is made visible.
function exc7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exc7 (see VARARGIN)

% Choose default command line output for exc7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exc7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = exc7_OutputFcn(hObject, eventdata, handles) 
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
for i=1:10
  [FileName,PathName] = uigetfile({'*.*'},'Load jpg Image File');
if (FileName==0)
    % if user not selects the image from db then show warning messsage
    msgbox('select the image form the image database','Error','warn');
    return;
end
  Img=imread([PathName FileName]);
  switch i
      case 1
         axes(handles.axes1);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes15);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes25);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes35);
         imshow(ied);
     case 2
         axes(handles.axes2);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes16);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes26);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes36);
         imshow(ied);
     case 3
         axes(handles.axes3);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes17);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes27);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes37);
         imshow(ied);
     case 4
         axes(handles.axes4);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes18);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes28);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes38);
         imshow(ied);
     case 5
         axes(handles.axes5);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes19);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes29);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes39);
         imshow(ied);
     case 6
         axes(handles.axes6);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes20);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes30);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes40);
         imshow(ied);
     case 7
         axes(handles.axes7);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes21);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes31);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes41);
         imshow(ied);
     case 8
         axes(handles.axes8);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes22);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes32);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes42);
         imshow(ied);
     case 9
         axes(handles.axes9);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes23);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes33);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes43);
         imshow(ied);
     case 10
         axes(handles.axes10);
         imshow(Img);    
         igray=rgb2gray(Img);
         axes(handles.axes24);
         imshow(igray);
         ibw=dither(igray);
         axes(handles.axes34);
         imshow(ibw);
         ied=edge(igray,'canny');
         axes(handles.axes44);
         imshow(ied);
 
        
  end
  
  

end

end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
