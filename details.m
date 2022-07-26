function varargout = details(varargin)
% DETAILS MATLAB code for details.fig
%      DETAILS, by itself, creates a new DETAILS or raises the existing
%      singleton*.
%
%      H = DETAILS returns the handle to a new DETAILS or the handle to
%      the existing singleton*.
%
%      DETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETAILS.M with the given input arguments.
%
%      DETAILS('Property','Value',...) creates a new DETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before details_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to details_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help details

% Last Modified by GUIDE v2.5 22-May-2022 15:52:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @details_OpeningFcn, ...
                   'gui_OutputFcn',  @details_OutputFcn, ...
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


% --- Executes just before details is made visible.
function details_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to details (see VARARGIN)

% Choose default command line output for details
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes details wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = details_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=findobj('tag','project');
N=getappdata(0,'a');
ord = strcat('Order: ',num2str(N));
set(handles.order,'String',ord);% Get default command line output from handles structure
band=getappdata(0,'b');
set(handles.band,'String',band);
den=getappdata(0,'e');
num=getappdata(0,'d');
fs=getappdata(0,'f');
system= tf(num,den,1/fs);
axes(handles.step);
s = stepz(num,den);
stem(s);
axes(handles.imp);
h=impz(num,den);
stem(h);
axes(handles.zp);
pzmap(system);
H1=freqz(num,den,512,fs);
fin = linspace(0,18000,512);
axes(handles.gp);
yyaxis left
plot(fin,20*log10(abs(H1)));
ylabel('Magnitude (dB)');
yyaxis right
plot(fin,angle(H1));
ylabel('Angle (radian)');
varargout{1} = handles.output;
% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)

% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function bandd_Callback(hObject, eventdata, handles)
% hObject    handle to bandd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandd as text
%        str2double(get(hObject,'String')) returns contents of bandd as a double


% --- Executes during object creation, after setting all properties.
function bandd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
