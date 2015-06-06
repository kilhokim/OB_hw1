function GUI_example

  hFigure = figure('Position',[100 100 200 200],...  %# Create a figure
                   'MenuBar','none',...
                   'ToolBar','none');
  hEdit = uicontrol('Style','edit',...               %# Create a multi-line
                    'Parent',hFigure,...             %#   editable text box
                    'Position',[10 30 180 160],...
                    'Max',2,...
                    'String',{'(type here)'});
  hButton = uicontrol('Style','pushbutton',...       %# Create a push button
                      'Parent',hFigure,...
                      'Position',[50 5 100 20],...
                      'String','Turn moving on',...
                      'Callback',@button_callback);

  function button_callback(hSource,eventData)        %# Nested button callback

    if strcmp(get(hSource,'String'),'Turn moving on')
      set(hSource,'String','Turn moving off');          %# Change button text
      set(hEdit,'Enable','inactive',...                 %# Disable the callback
                'ButtonDownFcn','selectmoveresize',...  %# Turn on moving, etc.
                'Selected','on');                       %# Display as selected
    else
      set(hSource,'String','Turn moving on');           %# Change button text
      set(hEdit,'Enable','on',...                       %# Re-enable the callback
                'ButtonDownFcn','',...                  %# Turn off moving, etc.
                'Selected','off');                      %# Display as unselected
    end

  end

end