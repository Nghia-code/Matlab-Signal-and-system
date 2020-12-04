function varargout = vidu(varargin)
% VIDU MATLAB code for vidu.fig
%      VIDU, by itself, creates a new VIDU or raises the existing
%      singleton*.
%
%      H = VIDU returns the handle to a new VIDU or the handle to
%      the existing singleton*.
%
%      VIDU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDU.M with the given input arguments.
%
%      VIDU('Property','Value',...) creates a new VIDU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vidu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vidu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vidu

% Last Modified by GUIDE v2.5 29-Nov-2020 21:41:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vidu_OpeningFcn, ...
                   'gui_OutputFcn',  @vidu_OutputFcn, ...
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


% --- Executes just before vidu is made visible.
function vidu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vidu (see VARARGIN)

% Choose default command line output for vidu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
biendo = get(handles.slider1,'value');
biendo = num2str(biendo);
set(handles.R1,'string',biendo)



% UIWAIT makes vidu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vidu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function pushbutton1_Callback(hObject, eventdata, handles)
luachon = get(handles.luachon,'value');
% slider1 = get(handles.slider1,'value')
R1 = get(handles.slider1,'value')
% R1 = str2doublue(get(handles.R1value,'Value'));

% R2 = str2double(get(handles.R2value,'String'));
R2 = get(handles.slider2,'value')


Vin = str2double((get(handles.Vin,'String')));


Inverting = Vin * ( -R2/R1)
Noninverting = Vin * (1 + R2/R1);


switch luachon
    
     case 1
axes(handles.axes7);
t = -5*pi:0.1:5*pi;
plot(t,Inverting*t);
grid on;
xlabel('Hz');
ylabel('U');

     case 2
axes(handles.axes6);
t = -5*pi:0.1:5*pi;
plot(t,Noninverting*t);
grid on;
xlabel('Hz');
ylabel('U');

     case 3
axes(handles.axes1);
t = -5*pi:0.1:5*pi;
plot(t,Inverting*sin(t));
hold on;
plot(t,Vin*sin(t));
grid on;
xlabel('Hz');
ylabel('U');

    case 4
axes(handles.axes5); 
t = -5*pi:0.1:5*pi;
plot(t,Noninverting*sin(t));
hold on;
plot(t,Vin*sin(t));
grid on;
xlabel('Hz');
ylabel('U');
   
 

end
        

function luachon_Callback(hObject, eventdata, handles)



function luachon_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slider1_Callback(hObject, eventdata, handles)
slider1 = get(handles.slider1,'value');
slider1 = num2str(slider1);
set(handles.R1,'string',slider1)

 
function slider1_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function R1_Callback(hObject, eventdata, handles)
Newslidervalue1 = get(handles.R1,'string');
Newslidervalue1 = num2str(Newslidervalue1);
set(handles.slider1,'value',Newslidervalue1)



function R1_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Close_Callback(hObject, eventdata, handles)

%Needed-
function pushbutton2_Callback(hObject, eventdata, handles)
choice = questdlg('Would you like to close?', ...
	'Choice Menu', ...
	'Yes','No','No');
switch choice
    case 'Yes'
        close
    case 'No'
end


function pushbutton3_Callback(hObject, eventdata, handles)    
luachonhinh = get(handles.luachonhinh,'value');
switch luachonhinh
    case 1
        axes(handles.axes3);
        img1 = imread('C:\Users\ACER\Desktop\Mat\Non-inverting.gif');
        imshow(img1);     

    case 2
            axes(handles.axes3);
            img2 = imread('C:\Users\ACER\Desktop\Mat\Inverting.gif');
            imshow(img2);
 
end



function luachonhinh_Callback(hObject, eventdata, handles)


function luachonhinh_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function luachonhinh_KeyPressFcn(hObject, eventdata, handles)


function R1value_Callback(hObject, eventdata, handles)


function R1value_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function R2value_Callback(hObject, eventdata, handles)


function R2value_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Vin_Callback(hObject, eventdata, handles)
newslidervalue3 = get(handles.Vin,'string');
newslidervalue3 = num2str(newslidervalue3);
set(handles.slider3,'value',newslidervalue3)


function Vin_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton4_Callback(hObject, eventdata, handles)
cla;


function slider2_Callback(hObject, eventdata, handles)
slider2= get(handles.slider2,'value');
slider2s = num2str(slider2);
set(handles.R2,'string',slider2)



function slider2_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function R2_Callback(hObject, eventdata, handles)
Newslidervalue2 = get(handles.R2,'string');
Newslidervalue2 = num2str(Newslidervalue2);
set(handles.slider2,'value',Newslidervalue2)


function R2_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slider3_Callback(hObject, eventdata, handles)
slider3 = get(handles.slider3,'value');
slider3 = num2str(slider3);
set(handles.Vin,'string',slider3)


function slider3_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function axes1_CreateFcn(hObject, eventdata, handles)


function axes5_CreateFcn(hObject, eventdata, handles)
