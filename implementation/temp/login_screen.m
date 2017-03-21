function varargout = login_screen(varargin)
% LOGIN_SCREEN MATLAB code for login_screen.fig
%      LOGIN_SCREEN, by itself, creates a new LOGIN_SCREEN or raises the existing
%      singleton*.
%
%      H = LOGIN_SCREEN returns the handle to a new LOGIN_SCREEN or the handle to
%      the existing singleton*.
%
%      LOGIN_SCREEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGIN_SCREEN.M with the given input arguments.
%
%      LOGIN_SCREEN('Property','Value',...) creates a new LOGIN_SCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before login_screen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to login_screen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help login_screen

% Last Modified by GUIDE v2.5 30-May-2013 18:44:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @login_screen_OpeningFcn, ...
                   'gui_OutputFcn',  @login_screen_OutputFcn, ...
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

% --- Executes just before login_screen is made visible.
function login_screen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to login_screen (see VARARGIN)

% Choose default command line output for login_screen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes login_screen wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handlesWithKeyPressFcn = ...
            findobj(handles.edit3, '-property','KeyPressFcn');
set(handlesWithKeyPressFcn, 'KeyPressFcn', {@KeyPress_Function, handles});

end

% --- Outputs from this function are returned to the command line.
function varargout = login_screen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles
a=3;
a

uname = get(handles.edit1,'String');
password = get(handles.edit1,'String');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
end

%% Hide Password
function KeyPress_Function(h,eventdata,fig)
% Function to replace all characters in the password edit box with
% asterisks

password = get(fig.edit3,'String')
% % % % % % switch key
% % % % % %     case 'backspace'
% % % % % %         password = password(1:end-1); % Delete the last character in the password
% % % % % %     case 'return'  % This cannot be done through callback without making tab to the same thing
% % % % % %         gui = getappdata(0,'logindlg');
% % % % % %         %pushbutton1_Callback([],[],);
% % % % % %     case 'escape'
% % % % % %         % Close the login dialog
% % % % % %         Escape(fig,[])
% % % % % %     otherwise
% % % % % %         password = [password get(fig,'currentcharacter')]; % Add the typed character to the password
% % % % % % end
% % % % % % 
% % % % % % SizePass = size(password); % Find the number of asterisks
% % % % % % if SizePass(2) > 0
% % % % % %     asterisk(1,1:SizePass(2)) = '*'; % Create a string of asterisks the same size as the password
% % % % % %     set(h,'String',asterisk) % Set the text in the password edit box to the asterisk string
% % % % % % else
% % % % % %     set(h,'String','')
% % % % % % end
% % % % % % 
% % % % % % set(h,'Userdata',password) % Store the password in its current state
end