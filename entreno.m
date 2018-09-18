function varargout = entreno(varargin)
% ENTRENO MATLAB code for entreno.fig
%      ENTRENO, by itself, creates a new ENTRENO or raises the existing
%      singleton*.
%
%      H = ENTRENO returns the handle to a new ENTRENO or the handle to
%      the existing singleton*.
%
%      ENTRENO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTRENO.M with the given input arguments.
%
%      ENTRENO('Property','Value',...) creates a new ENTRENO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before entreno_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to entreno_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help entreno

% Last Modified by GUIDE v2.5 15-Dec-2016 09:50:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @entreno_OpeningFcn, ...
    'gui_OutputFcn',  @entreno_OutputFcn, ...
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


% --- Executes just before entreno is made visible.
function entreno_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to entreno (see VARARGIN)

% Choose default command line output for entreno
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes entreno wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = entreno_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonA.
function pushbuttonA_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coeficientesVocal ('a')                                     % Características vocal a


% --- Executes on button press in pushbuttonI.
function pushbuttonI_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coeficientesVocal ('i')                                     % Características vocal i


% --- Executes on button press in pushbuttonU.
function pushbuttonU_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coeficientesVocal ('u')                                     % Características vocal u


% --- Executes on button press in pushbuttonE.
function pushbuttonE_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coeficientesVocal ('e')                                     % Características vocal e


% --- Executes on button press in pushbuttonO.
function pushbuttonO_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coeficientesVocal ('o')                                     % Características vocal o


% --- Executes on button press in pushbuttonReconocer.
function pushbuttonReconocer_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonReconocer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Grabar('Voz','voz');
mvocal=zeros(5,1);
for i=1:30
    [sol,min]=Reconoce();
    disp(strcat ('reconozco :',sol,' dist',num2str(min)));
    switch sol
        case 'a'
            ind=1;
        case 'e'
            ind=2;
        case 'i'
            ind=3;
        case 'o'
            ind=4;
        case 'u'
            ind=5;
        otherwise
            ind=9;
    end
    mvocal(ind) = mvocal(ind) + 1;
end
solucion=-1;
for i=1:5
    disp (strcat ('indice ',num2str(i),' es ',num2str(mvocal(i))));
    if (solucion < mvocal(i))
        solN=i;
        solucion=mvocal(i);
    end
end
switch solN
    case 1
        sol='a';
    case 2
        sol='e';
    case 3
        sol='i';
    case 4
        sol='o';
    case 5
        sol='u';
    otherwise
        sol='m';
        
end
%solucion =sprintf('Sol = %s %f',sol,min);
disp (sol);
solucion =sprintf('%s',sol);
%disp(handles.Resultado);
set(handles.Resultado,'String', solucion);


% --- Executes on button press in pushbuttonValidar.
function pushbuttonValidar_Callback(hObject, eventdata, handles)    %Función auxiliar
% hObject    handle to pushbuttonValidar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sol = get(handles.Resultado,'String');
%disp (['Encontramos ',sol]);
RenameVoz(sol);


% --- Executes during object creation, after setting all properties.
function Resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
