function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 12-Jun-2015 13:05:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)
                    
% handles.hPlotAxes.Title.String = 'Total possible postures';
title('Total possible postures');
handles.min_x = -60;
handles.max_x = 140;
handles.min_y = 0;
handles.max_y = 200;
axis([handles.min_x, handles.max_x, handles.min_y, handles.max_y]);           
%set(handles.world_axes, 'ButtonDownFcn', @AxesClickCallback);

set(gca, 'Xtick', -60:10:140);
set(gca, 'Ytick', 0:10:200);
grid on;
hold on;

% Single person's features
handles.single_stature = 170;
handles.single_weight = 5;
handles.single_gender = 1;  % male: 1, female: 2
handles.single_age = 25;
% Multiple persons' features
handles.multiple_population = 100;
handles.multiple_gender = 1;  % male: 1, female: 2, all: 3
handles.multiple_age_min = 25;
handles.multiple_age_max = 50;
% Flag for currently analyzing for multiple persons or not
handles.isMultiple = 0;   % If analyzing for multiple persons: 1

% Matrices for obstacles and the target info
handles.Bplots = [];
handles.B = [];
handles.Tplots = [];
handles.T = [];

set(handles.multiple_panel, 'Visible', 'off');
%set(handles.single_panel, 'Visible', 'on');

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



function AxesClickCallback(objectHandle, eventData, handles, flag)
axesHandle  = get(objectHandle, 'Parent');
%coordinates = get(axesHandle,'CurrentPoint'); 
%coordinates = coordinates(1,1:2);
if flag == 0
    new_message = sprintf('%s\n%s', '?ï¿½ï¿½?ë¬¼ï¿½? ?????? ?ï¿½ï¿½? ï¿?????ï¿½ë¦­??????.',...
                                     '??ï¿½ï¿½ ï¿?ï¿½ï¿½ìª½ï¿½? ?ï¿½ë¦­??ï¿½ï¿½ ï¿???ï¿½ï¿½???');
else
    new_message = sprintf('%s', 'ëª©ï¿½?ë¬¼ï¿½? ?????? ?ï¿½ï¿½? ï¿?????ï¿½ë¦­??????.');
end
set(handles.message_text, 'String', new_message);

if flag == 0
    %set(gcf, 'KeyPressFcn', @AxesKeyPressFcn)
    i = 0;
    while 1
        i = i + 1;
        coordinates = ginput(1);
        if coordinates(1) < handles.min_x | coordinates(1) > handles.max_x | ...
           coordinates(2) < handles.min_y | coordinates(2) > handles.max_y
            break
        end
        %message = sprintf('i: %d, x: %.1f, y: %.1f', i, coordinates(1), coordinates(2));
        %set(handles.message_text, 'String', message);
        curr_x = floor(coordinates(1)/10)*10;
        curr_y = floor(coordinates(2)/10)*10;
        curr_w = 10;  curr_h = 10;
        new_B = [curr_x, curr_y, curr_w, curr_h];
        if length(handles.B) == 0   % Empty handles.B in the beginning
            p = BPLOT(new_B, 1);
            handles.Bplots = [handles.Bplots; p];
            handles.B = [handles.B; new_B];
        else
            [~, indices] = ismember(handles.B(:,1:2), new_B(1:2), 'rows');
            is_duplicate = find(indices == 1);
            if length(is_duplicate) > 0   % duplicate row found
                p = handles.Bplots(is_duplicate);
                delete(p);
                handles.Bplots = removerows(handles.Bplots, 'ind', is_duplicate);
                handles.B = removerows(handles.B, 'ind', is_duplicate);
            else
                p = BPLOT(new_B, 1);
                handles.Bplots = [handles.Bplots; p];
                handles.B = [handles.B; new_B];
            end
        end
    end
else
    coordinates = ginput(1);
    curr_x = floor(coordinates(1)/10)*10;
    curr_y = floor(coordinates(2)/10)*10;
    curr_w = 10;  curr_h = 10;
    new_T = [curr_x, curr_y, curr_w, curr_h];
    if length(handles.T) == 0   % Empty handles.T in the beginning
        p = TPLOT(new_T);
        handles.Tplot = p;
        handles.T = new_T;
    else
        delete(handles.Tplot);
        handles.Tplot = TPLOT(new_T);
        handles.T = new_T;
    end
end
guidata(objectHandle,handles);



% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Create dataset
if ~exist('CELL', 'dir')
    CELL_CONSTRUCTION;
end
dirInfo = dir('CELL');
if sum(cat(1, dirInfo.bytes)) == 0
    MEMORY_CONSTRUCTION;
end

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in draw_obs_button.
function draw_obs_button_Callback(hObject, eventdata, handles)
% hObject    handle to draw_obs_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

AxesClickCallback(hObject, eventdata, handles, 0)


% --- Executes during object creation, after setting all properties.
function single_stature_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_stature_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function single_stature_edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.single_stature = str2double(get(handles.single_stature_edit, 'string'));


% --- Executes during object creation, after setting all properties.
function single_age_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_age_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function single_age_edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.single_age = str2double(get(handles.single_age_edit, 'string'));


% --- Executes during object creation, after setting all properties.
function single_gender_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_gender_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function single_gender_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.single_gender = get(handles.single_gender_popupmenu, 'Value');


% --- Executes on button press in draw_target_button.
function draw_target_button_Callback(hObject, eventdata, handles)
% hObject    handle to draw_target_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AxesClickCallback(hObject, eventdata, handles, 1)


% --- Executes during object creation, after setting all properties.
function single_weight_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_weight_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function single_weight_edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.single_weight = str2double(get(handles.single_weight_edit, 'string'));


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch hObject
    case handles.single_radiobutton
        set(handles.multiple_panel, 'Visible', 'off');
        set(handles.single_panel, 'Visible', 'on');
        handles.isMultiple = 0;
    case handles.multiple_radiobutton
        set(handles.single_panel, 'Visible', 'off');
        set(handles.multiple_panel, 'Visible', 'on');
        handles.isMultiple = 1;
end
guidata(hObject,handles);




function multiple_population_edit_Callback(hObject, eventdata, handles)
% hObject    handle to multiple_population_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of multiple_population_edit as text
%        str2double(get(hObject,'String')) returns contents of multiple_population_edit as a double
handles.multiple_population = str2double(get(handles.multiple_population_edit, 'string'));



% --- Executes during object creation, after setting all properties.
function multiple_population_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multiple_population_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function multiple_age_min_edit_Callback(hObject, eventdata, handles)
% hObject    handle to multiple_age_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of multiple_age_min_edit as text
%        str2double(get(hObject,'String')) returns contents of multiple_age_min_edit as a double
handles.multiple_age_min = str2double(get(handles.multiple_age_min_edit, 'string'));


% --- Executes during object creation, after setting all properties.
function multiple_age_min_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multiple_age_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in multiple_gender_popupmenu.
function multiple_gender_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to multiple_gender_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns multiple_gender_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from multiple_gender_popupmenu
handles.multiple_gender = str2double(get(handles.multiple_gender_popupmenu, 'string'));


% --- Executes during object creation, after setting all properties.
function multiple_gender_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multiple_gender_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function multiple_age_max_edit_Callback(hObject, eventdata, handles)
% hObject    handle to multiple_age_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of multiple_age_max_edit as text
%        str2double(get(hObject,'String')) returns contents of multiple_age_max_edit as a double
handles.multiple_age_max = str2double(get(handles.multiple_age_max_edit, 'string'));


% --- Executes during object creation, after setting all properties.
function multiple_age_max_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to multiple_age_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
title('Total possible postures');
handles.Bplots = [];
handles.B = [];
handles.Tplots = [];
handles.T = [];
cla();
guidata(hObject, handles);


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

p1_L =   45; p1_U =  90; 
p2_L =    0; p2_U = 160; 
p3_L = -160; p3_U =   0; 
p4_L = -180; p4_U = -20; 
p5_L =   30; p5_U = 180; 

% Set target coordinates
%helpdlg(sprintf('%d, %d', handles.T(1), handles.T(2)));
X_tar = handles.T(1,1);
Y_tar = handles.T(1,2);
T = [X_tar Y_tar];
T_center = [X_tar+5 Y_tar+5];
load_tar = 0;  % Fix target weight to 0


%% Load the relevant cell
XX = T(1);
YY = T(2);

cell_name = ['CELL_X' num2str(XX) 'Y' num2str(YY)];
cell_name = strrep(fullfile('CELL',cell_name), '-', 'N');

postures = load(cell_name);
temp = size(postures);
numP = temp(1);

% Sort postures with torque in ascending order
[A_sorted sorted_index] = sort(postures, 1);
for i=1:21
    A_sorted(:,i) = postures(sorted_index(:,22), i);
end
postures = A_sorted;

% Set methods of posture adjustment
adjustment_methods = [2 3 4 5];

% Load posture data from memory
if handles.isMultiple == 0
    % Pick a single link row
    links = PICK_PERSON(handles.single_gender, ...
        handles.single_age, handles.single_stature, ...
        handles.single_weight);
else  % handles.isMultiple == 1
    % Pick multiple link rows
    links = PICK_PEOPLE(handles.multiple_population, ...
        handles.multiple_gender, handles.multiple_age_min, ...
        handles.multiple_age_max);
end

%links = xlsread('link.xlsx');
%links_length = length(links);

additional_w = xlsread('additional_w.xlsx');

num_of_target_touch = 0;
num_persons = size(links);
%% Run analysis
for p = 1:num_persons(1)
    test_data = links(p,:);
    test_L = test_data(6:11)/10;
    test_R = test_data(12:16)/20;       

    result_postures = [];

    start_time = clock;
    B = handles.B;
    C = [];
    is_over = -1;

    %rebas = []

    for i=1:numP
        if is_over == 0
            break;
        end

        %% Searching process
        training_posture = postures(i,1:7); % add theta 6,7
        training_w = postures(i, 16:20);
        training_length = postures(i, 10:15);

        % Calculate potential
        potential = POTENTIAL2(training_length, training_posture, B, C, training_w);
        if potential ~= 0
            continue;
        end

        %% Adjustment process
        for adjustment_method = adjustment_methods
            result_posture = [postures(i, :) test_L zeros(1,13)];
            result_posture(29) = adjustment_method;

            switch adjustment_method
                case 2
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 2);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 3
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 3);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 4
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 4);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
                case 5
                    posture = ADJUSTMENT_POSTURE(training_posture, training_length, test_L, 5);
                    if posture ==1
                        result_posture(30) = 0;
                        result_postures = [result_postures; result_posture];
                        continue;
                    end
            end
            %% Adjustment process: Determine Success/Failure

            % Improve neck angle
            neck = NECK(test_L, posture, T_center);
            if neck == -1000
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            else
                posture(8) = neck;
            end

            % Calculate potential
            potential = POTENTIAL2(test_L, posture, B, C, test_R);
            if (potential == 0)
                result_posture(30) = 1;
            else
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            end

            % BOS limitations
            COM_LOC = COM_LOCATION(test_L,posture);
            HAND_LOC = HAND_LOCATION(test_L,posture);
            SHOULDER_LOC = SHOULDER_LOCATION(test_L,posture);
            H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);


            % Calculate BOS when the other leg is added
            if posture(6) ~=0 && posture(7) ~=0
                if COM_LOC(3) == 0 || (COM_LOC(1) > COM_LOC(3)+15) || (COM_LOC(1) < -5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0)
                    result_posture(30) = 0;
                    result_postures = [result_postures; result_posture];
                else
                    result_posture(30) = 1;
                end

            else
                if ((COM_LOC(1)>15) || (COM_LOC(1)<-5) || (HAND_LOC(1)<5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0))
                    result_posture(30) = 0;
                    result_postures = [result_postures; result_posture];
                    continue
                else
                    result_posture(30) = 1;
                end
            end

            % Angle limitations
            if (posture(1)>p1_L && posture(1)<p1_U && posture(2)>p2_L && posture(2)<p2_U && posture(3)>p3_L && posture(3)<p3_U && posture(4)>p4_L && posture(4)<p4_U && posture(5)>p5_L && posture(5)<p5_U)
                result_posture(30) = 1;
            else
                result_posture(30) = 0;
                result_postures = [result_postures; result_posture];
                continue
            end
            result_posture(31:38) = posture;


            %% Calculate REBA score (39)
            reba_score = REBA(test_L, posture, Y_tar, load_tar);   % REBA score for current posture
            result_posture(39) = reba_score;

            %% Re-calculate torque (40)
            torq = sum(abs(JOINT_TORQUE(test_L,posture)));   % torq for current posture
            result_posture(40) = torq;

            %% Add visibility (41)
            vs_pt = VISIBILITY(test_L, posture, test_R, B, T_center, C);
            if vs_pt > 0
                visibility = 0;  % visibility for current posture
            elseif vs_pt == 0
                visibility = 1;
            end
            result_posture(41) = visibility;

            result_postures = [result_postures; result_posture]; 
            
            a_w = additional_w(additional_w(:,1)==p, 2:end)/10;

            if handles.isMultiple == 0
                rannum = randi(100);
                cmap = hsv(100);
                VISUALIZE(1, test_L, posture, test_R, a_w, cmap(rannum,:));
            else
                cmap = hsv(100);
                VISUALIZE(1, test_L, posture, test_R, a_w, cmap(p,:));
            end      

            num_of_target_touch = num_of_target_touch+1;

            if handles.isMultiple == 1
                is_over = 0;
            end

            % rebas = [rebas; reba_score];

            break;

        end


    end

    execution_time = etime(clock, start_time);
    title_str=[num2str(num_of_target_touch), ' postures, ', num2str(execution_time), ' s'];
    title(title_str);
end

% exelï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
%     filename = ['result_stature_', num2str(user_id), '_boundary_', num2str(boundary)];
%     xlswrite(filename, result_postures);


