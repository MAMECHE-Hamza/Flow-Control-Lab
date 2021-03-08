function varargout = FlowControl(varargin)
% FLOWCONTROL MATLAB code for FlowControl.fig
%      FLOWCONTROL, by itself, creates a new FLOWCONTROL or raises the existing
%      singleton*.
%
%      H = FLOWCONTROL returns the handle to a new FLOWCONTROL or the handle to
%      the existing singleton*.
%
%      FLOWCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLOWCONTROL.M with the given input arguments.
%
%      FLOWCONTROL('Property','Value',...) creates a new FLOWCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FlowControl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FlowControl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help FlowControl
% Last Modified by GUIDE v2.5 19-Nov-2019 05:04:02
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FlowControl_OpeningFcn, ...
                   'gui_OutputFcn',  @FlowControl_OutputFcn, ...
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

% --- Executes just before FlowControl is made visible.
function FlowControl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FlowControl (see VARARGIN)

% Choose default command line output for FlowControl
handles.output = hObject;
 imshow('plant.PNG','Parent',handles.axes1);
 imshow('pid.PNG','Parent',handles.axes2);
 set(handles.Actuator,'Enable','off');
       set(handles.Input,'Enable','off');
 set(handles.Setpoint,'Enable','off');
        set(handles.K,'Enable','off');
        set(handles.edit21,'Enable','off');
        set(handles.Kd,'Enable','off');
        set(handles.a,'Enable','off');
    set(handles.run_stop,'Enable','off');

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes FlowControl wait for user response (see UIRESUME)
% uiwait(handles.FlowControl);

% --- Outputs from this function are returned to the command line.
function varargout = FlowControl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%display(handles.Humidite1Text);
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Pertubation1.
function Pertubation1_Callback(hObject, eventdata, handles)
% hObject    handle to Pertubation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pertubation1
global dde
checked = get(hObject,'Value');

% --- Executes on button press in Pertubation2.
function Pertubation2_Callback(hObject, eventdata, handles)
% hObject    handle to Pertubation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pertubation2
global dde
checked = get(hObject,'Value');
ddepoke(dde, 'pertubation2', checked);

function BrumeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to BrumeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BrumeEdit as text
%        str2double(get(hObject,'String')) returns contents of BrumeEdit as a double
global dde
value = str2double(get(hObject,'String'));
ddepoke(dde, 'CdeBrume', value*100);

% --- Executes during object creation, after setting all properties.
function BrumeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BrumeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ResistanceEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ResistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ResistanceEdit as text
%        str2double(get(hObject,'String')) returns contents of ResistanceEdit as a double
value = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function ResistanceEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ResistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ventilateur1Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Ventilateur1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ventilateur1Edit as text
%        str2double(get(hObject,'String')) returns contents of Ventilateur1Edit as a double
global dde
value = str2double(get(hObject,'String'));
ddepoke(dde, 'CdeVent1', value*10);


% --- Executes during object creation, after setting all properties.
function Ventilateur1Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ventilateur1Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ventilateur2Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Ventilateur2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ventilateur2Edit as text
%        str2double(get(hObject,'String')) returns contents of Ventilateur2Edit as a double
global dde
value = str2double(get(hObject,'String'));
ddepoke(dde, 'CdeVent2', value*10);

% --- Executes during object creation, after setting all properties.
function Ventilateur2Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ventilateur2Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Humidite1Text_Callback(hObject, eventdata, handles)
% hObject    handle to Humidite1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Humidite1Text as text
%        str2double(get(hObject,'String')) returns contents of Humidite1Text as a double


% --- Executes during object creation, after setting all properties.
function Humidite1Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Humidite1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Humidite2Text_Callback(hObject, eventdata, handles)
% hObject    handle to Humidite2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Humidite2Text as text
%        str2double(get(hObject,'String')) returns contents of Humidite2Text as a double


% --- Executes during object creation, after setting all properties.
function Humidite2Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Humidite2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Humidite3Text_Callback(hObject, eventdata, handles)
% hObject    handle to Humidite3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Humidite3Text as text
%        str2double(get(hObject,'String')) returns contents of Humidite3Text as a double


% --- Executes during object creation, after setting all properties.
function Humidite3Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Humidite3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VitesseText_Callback(hObject, eventdata, handles)
% hObject    handle to VitesseText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VitesseText as text
%        str2double(get(hObject,'String')) returns contents of VitesseText as a double


% --- Executes during object creation, after setting all properties.
function VitesseText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VitesseText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Temperature1Text_Callback(hObject, eventdata, handles)
% hObject    handle to Temperature1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Temperature1Text as text
%        str2double(get(hObject,'String')) returns contents of Temperature1Text as a double


% --- Executes during object creation, after setting all properties.
function Temperature1Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Temperature1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Temperature2Text_Callback(hObject, eventdata, handles)
% hObject    handle to Temperature2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Temperature2Text as text
%        str2double(get(hObject,'String')) returns contents of Temperature2Text as a double


% --- Executes during object creation, after setting all properties.
function Temperature2Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Temperature2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Temperature3Text_Callback(hObject, eventdata, handles)
% hObject    handle to Temperature3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Temperature3Text as text
%        str2double(get(hObject,'String')) returns contents of Temperature3Text as a double


% --- Executes during object creation, after setting all properties.
function Temperature3Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Temperature3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function FlowControl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FlowControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global dde
global mytimer
global donnees i
i=1;
donnees=struct('temp1',0,'temp2',0,'temp3',0,'hum1',0,...
      'hum2',0,'hum3',0,'fan1',0,'fan2',0,'mist',0);
%system('CDMDDE')
%dde = ddeinit('cmddde.exe', ''); % ddeinit('CDMDDE','\\ad.u-ga.fr\home\m\mamecheh\Bureau\Flow\FlowControl\BA26.cdm')
dde = ddeinit('CDMDDE', '\\ad.u-ga.fr\home\m\mamecheh\Bureau\Flow\FlowControl\BA26.cdm');
mytimer = timer();
mytimer.Period = 0.1;
mytimer.ExecutionMode = 'fixedSpacing';%'fixedRate';
mytimer.TimerFcn = @TimerFcn; % Here is where you assign the callback function
mytimer.UserData = guihandles;
start(mytimer);

% --- Executes during object deletion, before destroying properties.
function FlowControl_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to FlowControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
global mytimer
ddepoke(dde, 'CdeVent1', 0);
ddepoke(dde, 'CdeVent2', 0);
ddepoke(dde, 'CdeBrume', 0);
ddepoke(dde, 'K', 0);
ddepoke(dde, 'Ki', 0);
ddepoke(dde, 'Kd', 0);
ddepoke(dde, 'a', 0);
ddepoke(dde, 'Actionneur', 0);
ddepoke(dde, 'DepControle', 0);
ddepoke(dde, 'DepContRST', 0);
ddepoke(dde, 'ChoixCapteur', 0);
ddepoke(dde, 'Consigne', 0);
stop(mytimer);
delete(mytimer);
%stop(mytimer);
ddeterm(dde);
clear all

function TimerFcn(t,~)
global dde
handles = t.UserData;
global donnees;
%brume = ddereq(dde, 'Brume');
%resistance = ddereq(dde, 'resistance');
%ventilateur1 = ddereq(dde, 'ventilateur1');
%ventilateur2 = ddereq(dde, 'ventilateur2');
humidite1 = ddereq(dde, 'Hum1SR');
humidite2 = ddereq(dde, 'Hum2SR');
humidite3 = ddereq(dde, 'Hum3SR');
%vitesse = ddereq(dde, 'vitesse');
temperature1 = ddereq(dde, 'Tempe1SR');
temperature2 = ddereq(dde, 'Tempe2SR');
temperature3 = ddereq(dde, 'Tempe3SR');
venti1 = ddereq(dde, 'CdeVent2');
venti2 = ddereq(dde, 'CdeVent1');
Brume = ddereq(dde, 'CdeBrume');
donnees.temp1=temperature1;
donnees.temp2=temperature2;
donnees.temp3=temperature3;
donnees.hum1=humidite1;donnees.hum2=humidite2;donnees.hum3=humidite3;
donnees.fan1=venti1;donnees.fan2=venti2;donnees.mist=Brume;
%set(handles.BrumeText, 'String', num2str(brume));
% set(handles.ResistanceText, 'String', num2str(resistance));
% set(handles.Ventilateur1Text, 'String', num2str(ventilateur1));
% set(handles.Ventilateur2Text, 'String', num2str(ventilateur2));
set(handles.Humidite1Text, 'String', num2str(humidite1,4));
set(handles.Humidite2Text, 'String', num2str(humidite2,4));
set(handles.Humidite3Text, 'String', num2str(humidite3,4));
%set(handles.VitesseText, 'String', num2str(vitesse));
set(handles.Temperature1Text, 'String', num2str(temperature1,4));
set(handles.Temperature2Text, 'String', num2str(temperature2,4));
set(handles.Temperature3Text, 'String', num2str(temperature3,4));
set(handles.Ventilateur1Text, 'String', num2str(venti2/10,3));
set(handles.Ventilateur2Text, 'String', num2str(venti1/10,3));
set(handles.BrumeText, 'String', num2str(round(Brume/100),3));
% h=[ 10 12 10 14 15]; t=[ 10 11 11.5 12 13];
% docts = timeseries(h,t)
% tsout = addsample(tsin,'Data',datavals,'Time',timevals)


% --- Executes on selection change in Control.
function Control_Callback(hObject, eventdata, handles)
% hObject    handle to Control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
 Control_contents = cellstr(get(hObject,'String'));
 Control_pop_choice = Control_contents{get(hObject,'Value')};
 if strcmp(Control_pop_choice,'None')
     handles.Control_pop_nb = 0;
      set(handles.Actuator,'Enable','off');
       set(handles.Input,'Enable','off');
        set(handles.Setpoint,'Enable','off');
        set(handles.K,'Enable','off');
        set(handles.edit21,'Enable','off');
        set(handles.Kd,'Enable','off');
        set(handles.a,'Enable','off');
        set(handles.run_stop,'Enable','off');
     %ddepoke(dde, 'DepControle', 0);
    %ddepoke(dde, 'DepContRST', 0);
elseif  strcmp(Control_pop_choice,'PID discret')
    %ddepoke(dde, 'DepControle', 1);
    handles.Control_pop_nb = 1;
      set(handles.Actuator,'Enable','on');
       set(handles.Input,'Enable','on');
        set(handles.Setpoint,'Enable','off');
        set(handles.K,'Enable','off');
        set(handles.edit21,'Enable','off');
        set(handles.Kd,'Enable','off');
        set(handles.a,'Enable','off');
    set(handles.run_stop,'Enable','off');
 end
guidata(hObject,handles)
 
% Hints: contents = cellstr(get(hObject,'String')) returns Control contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Control


% --- Executes during object creation, after setting all properties.
function Control_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Actuator.
function Actuator_Callback(hObject, eventdata, handles)
% hObject    handle to Actuator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
Actuator_contents = cellstr(get(hObject,'String'));
Actuator_pop_choice = Actuator_contents{get(hObject,'Value')};
if strcmp(Actuator_pop_choice,'None')
    ddepoke(dde, 'Actionneur', 0);
elseif  strcmp(Actuator_pop_choice,'Mist')
    ddepoke(dde, 'Actionneur', 5);
end
 

% Hints: contents = cellstr(get(hObject,'String')) returns Actuator contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Actuator


% --- Executes during object creation, after setting all properties.
function Actuator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Actuator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Input.
function Input_Callback(hObject, eventdata, handles)
% hObject    handle to Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
Input_contents = cellstr(get(hObject,'String'));
 Input_pop_choice = Input_contents{get(hObject,'Value')};
 if strcmp(Input_pop_choice,'None')
      set(handles.Setpoint,'Enable','off');
        set(handles.K,'Enable','off');
        set(handles.edit21,'Enable','off');
        set(handles.Kd,'Enable','off');
        set(handles.a,'Enable','off');
    set(handles.run_stop,'Enable','off');
    ddepoke(dde, 'ChoixCapteur', 0);
 elseif  strcmp(Input_pop_choice,'Humidity 1')
     set(handles.Setpoint,'Enable','on');
        set(handles.K,'Enable','on');
        set(handles.edit21,'Enable','on');
        set(handles.Kd,'Enable','on');
        set(handles.a,'Enable','on');
    set(handles.run_stop,'Enable','on');
    ddepoke(dde, 'ChoixCapteur', 4);
 elseif  strcmp(Input_pop_choice,'Humidity 2')
      set(handles.Setpoint,'Enable','on');
        set(handles.K,'Enable','on');
        set(handles.edit21,'Enable','on');
        set(handles.Kd,'Enable','on');
        set(handles.a,'Enable','on');
    set(handles.run_stop,'Enable','on');
    ddepoke(dde, 'ChoixCapteur', 5);
 elseif  strcmp(Input_pop_choice,'Humidity 3')
      set(handles.Setpoint,'Enable','on');
        set(handles.K,'Enable','on');
        set(handles.edit21,'Enable','on');
        set(handles.Kd,'Enable','on');
        set(handles.a,'Enable','on');
    set(handles.run_stop,'Enable','on');
    ddepoke(dde, 'ChoixCapteur', 6);
 end
   
% Hints: contents = cellstr(get(hObject,'String')) returns Input contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Input


% --- Executes during object creation, after setting all properties.
function Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
  
end



function K_Callback(hObject, eventdata, handles)
% hObject    handle to statK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
K_val = str2double(get(hObject,'String'))
ddepoke(dde, 'K', K_val);
% Hints: get(hObject,'String') returns contents of statK as text
%        str2double(get(hObject,'String')) returns contents of statK as a double


% --- Executes during object creation, after setting all properties.
function statK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ki_Callback(hObject, eventdata, handles)
% hObject    handle to statKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
Ki_val = str2double(get(hObject,'String'));
ddepoke(dde, 'Ki', Ki_val);
% Hints: get(hObject,'String') returns contents of statKi as text
%        str2double(get(hObject,'String')) returns contents of statKi as a double


% --- Executes during object creation, after setting all properties.
function statKi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kd_Callback(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
Kd_val = str2double(get(hObject,'String'));
ddepoke(dde, 'Kd', Kd_val);
% Hints: get(hObject,'String') returns contents of Kd as text
%        str2double(get(hObject,'String')) returns contents of Kd as a double


% --- Executes during object creation, after setting all properties.
function Kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
a_val = str2double(get(hObject,'String'));
ddepoke(dde, 'a', a_val);
% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Setpoint_Callback(hObject, eventdata, handles)
% hObject    handle to Setpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
set_val = str2double(get(hObject,'String'))
ddepoke(dde, 'Consigne', set_val);
% Hints: get(hObject,'String') returns contents of Setpoint as text
%        str2double(get(hObject,'String')) returns contents of Setpoint as a double


% --- Executes during object creation, after setting all properties.
function Setpoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Setpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in run_stop.
function run_stop_Callback(hObject, eventdata, handles)
global dde
% hObject    handle to run_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run_stop = get(hObject,'Value');
%handles.Control_pop_nb
if run_stop == 0
     ddepoke(dde, 'DepControle', 0);
     ddepoke(dde, 'DepContRST', 0);
     set(handles.run_stop,'BackgroundColor',[0.941,0.941,0.941]);
elseif run_stop == 1
     ddepoke(dde, 'DepControle', handles.Control_pop_nb);
     ddepoke(dde, 'DepContRST', 0);
     set(handles.run_stop,'BackgroundColor',[0,1,0]);
 end

% Hint: get(hObject,'Value') returns toggle state of run_stop


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dde
K_val = str2double(get(hObject,'String'));
ddepoke(dde, 'Ki', K_val);
% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global dde
Ki_val = str2double(get(hObject,'String'));
ddepoke(dde, 'Ki', Ki_val);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function record_time_Callback(hObject, eventdata, handles)
% hObject    handle to record_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of record_time as text
%        str2double(get(hObject,'String')) returns contents of record_time as a double


% --- Executes during object creation, after setting all properties.
function record_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to record_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on button press in stat_stop_record.
% function stat_stop_record_Callback(hObject, eventdata, handles)
% % hObject    handle to stat_stop_record (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% start_stop = get(hObject,'Value');
% %handles.Control_pop_nb
% if start_stop == 0
%      ddepoke(dde, 'DepControle', 0);
%      ddepoke(dde, 'DepContRST', 0);
% elseif start_stop == 1
%      ddepoke(dde, 'DepControle', handles.Control_pop_nb);
%      ddepoke(dde, 'DepContRST', 0);
%  end
% % Hint: get(hObject,'Value') returns toggle state of stat_stop_record


% --- Executes on button press in stop_record.
function stop_record_Callback(hObject, eventdata, handles)
% hObject    handle to stop_record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_record;
global data i;
set(handles.record_time, 'String', num2str(0));
%data = t_record.UserData{3};
%dataa=tscollection({data.temp1;data.temp2;data.temp3;data.hum1;data.hum2;...
  %  data.hum3;data.fan1;data.fan2;data.mist});
%dataa.name=char(strcat('Data_',string(datetime)));
%save(char(strcat('Data_',string(datetime))), data);
eval(['save myfile',int2str(i),'.mat data'])
%save Data data
i=i+1;
stop(t_record);
delete(t_record);
clear t_record;
% --- Executes on button press in start_record.
% function start_record_Callback(hObject, eventdata, handles)
% % hObject    handle to start_record (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global t_record;
% data_temp = timeseries(strcat('Temp_',string(datetime) ));
% data_hum = timeseries(strcat('Hum_', string(datetime)));
% data_mist = timeseries(strcat('Mist_',string(datetime) ));
% data = struct('temp',data_temp,'hum',data_hum,'mist',data_mist);
% t_record = timer();
% t_record.Period = 1;
% t_record.ExecutionMode = 'fixedRate';
% t_record.TimerFcn = @recordfcn; % Here is where you assign the callback function
% T1=clock;
% t_record.UserData = {guihandles, T1, data};
% start(t_record);
% % set(handles.slider1,'UserData',data);
% set(handles.slider1,'UserData',data);
% set(handles.slider1,'UserData',data);





% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_record;
global data;

record = get(hObject,'Value');
%handles.Control_pop_nb
if record == 1
set(handles.record,'String','Recording');
set(handles.record,'BackgroundColor',[0,1,0]);
set(handles.stop_record,'Enable','off');
% data_temp = timeseries(char(strcat('Temp_',string(datetime))));
% data_hum = timeseries(char(strcat('Hum_',string(datetime))));
% data_mist = timeseries(char(strcat('Mist_',string(datetime))));
% data = struct('temp',data_temp,'hum',data_hum,'mist',data_mist);
data_temp1=timeseries('temp1');
data_temp2=timeseries('temp2');
data_temp3=timeseries('temp3');
data_hum1=timeseries('hum1');
data_hum2=timeseries('hum2');
data_hum3=timeseries('hum3');
data_fan1=timeseries('fan1');
data_fan2=timeseries('fan2');
data_mist=timeseries('mist');
%data=tscollection({data_temp1;data_temp2;data_temp3;data_hum1;data_hum2;...
  %  data_hum3;data_fan1;data_fan2;data_mist});
data=struct('temp1',data_temp1,'temp2',data_temp2,'temp3',data_temp3,'hum1',data_hum1,...
      'hum2',data_hum2,'hum3',data_hum3,'fan1',data_fan1,'fan2',data_fan2,'mist',data_mist);
t_record = timer();
t_record.Period = 1;
t_record.ExecutionMode = 'fixedrate';
t_record.TimerFcn = @recordfcn; % Here is where you assign the callback function
T1=clock;
t_record.UserData = {guihandles, T1};
start(t_record);

elseif record == 0
    set(handles.record,'String','Start Recording');
    set(handles.record,'BackgroundColor',[0.941,0.941,0.941]);
    set(handles.stop_record,'Enable','on');
    stop(t_record);
 end
% Hint: get(hObject,'Value') returns toggle state of record

function recordfcn(t2,~)
global data;
global donnees;
u=t2.UserData;
handles = u{1};
T1=u{2};
%data = t2.UserData{3};
tt=round(etime(clock,T1));
set(handles.record_time, 'String',num2str(tt) );
%  humidite1 = ddereq(dde, 'Hum1SR');
% humidite2 = ddereq(dde, 'Hum2SR');
% humidite3 = ddereq(dde, 'Hum3SR');
% %vitesse = ddereq(dde, 'vitesse');
% temperature1 = ddereq(dde, 'Tempe1SR');
% temperature2 = ddereq(dde, 'Tempe2SR');
% temperature3 = ddereq(dde, 'Tempe3SR');
% venti1 = ddereq(dde, 'CdeVent2');
% venti2 = ddereq(dde, 'CdeVent1');
% Brume = ddereq(dde, 'CdeBrume');

 data.temp1 = addsample(data.temp1,'Data',donnees.temp1,'Time',tt);
 data.temp2 = addsample(data.temp2,'Data',donnees.temp2,'Time',tt);
data.temp3 = addsample(data.temp3,'Data',donnees.temp3,'Time',tt);
data.hum1 = addsample(data.hum1,'Data',donnees.hum1,'Time',tt);
data.hum2 = addsample(data.hum2,'Data',donnees.hum2,'Time',tt);
data.hum3 = addsample(data.hum3,'Data',donnees.hum3,'Time',tt);
data.fan1 = addsample(data.hum1,'Data',donnees.fan1,'Time',tt);
data.fan2 = addsample(data.fan2,'Data',donnees.fan2,'Time',tt);
data.mist = addsample(data.mist,'Data',donnees.mist,'Time',tt);
% figure(1);
% plot(data.hum1)
% drawnow;
%t2.UserData{3}=data;
%set(handles.slider1,'UserData',data);
% set(handles.slider1,'UserData',data);
% set(handles.slider1,'UserData',data);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%imshow('system.PNG');
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%imshow('pid.PNG');
% Hint: place code in OpeningFcn to populate axes2
