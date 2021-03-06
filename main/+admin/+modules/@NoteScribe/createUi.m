function createUi(obj,fig)
import appbox.*;

set(fig, ...
  'Name', 'Note Taker', ...
  'position', screenCenter(314,300) ...
  );

addlistener(obj.view, 'KeyPress', @obj.keyCapture);
obj.mainLayout = uix.VBoxFlex( ...
  'Parent', fig ...
  );
obj.bodyLayout = uix.VBox( ...
  'Parent', obj.mainLayout, ...
  'spacing', 7 ...
  );
labelBox = uix.HBox( ...
  'Parent', obj.bodyLayout, ...
  'spacing', 11 ...
  );

obj.titleText = Label( ...
  'parent', labelBox, ...
  'string', 'Note (Ctrl+Enter):', ...
  'HorizontalAlignment', 'left' ...
  );
obj.statusText = Label( ...
  'parent', labelBox, ...
  'string', 'Status: ', ...
  'HorizontalAlignment', 'right' ...
  );
%set(obj.statusText, 'FontSize', 10);
%set(obj.statusText, 'FontName', 'Times New Roman');
set(labelBox, 'Widths', [-3,-5]);
obj.noteInput = uicontrol( ...
  'Parent', obj.bodyLayout, ...
  'Style', 'edit', ...
  'String', '', ...
  'HorizontalAlignment', 'left', ...
  'FontName', get(fig,'DefaultUiControlFontName'), ...
  'FontSize', 11, ...
  'Tag', 'NOTEINPUT', ...
  'Min', 0, ...
  'Max', 2 ... %enable multiple lines
  );
obj.buttonLayout = uix.VBox( ...
  'Parent', obj.mainLayout, ...
  'spacing', 7 ...
  );
obj.markButton = uicontrol( ...
  'Parent', obj.buttonLayout, ...
  'Style', 'pushbutton', ...
  'String', 'Mark Note', ...
  'FontUnits', get(fig, 'DefaultUicontrolFontUnits'), ...
  'FontName', get(fig, 'DefaultUicontrolFontName'), ...
  'FontSize', get(fig, 'DefaultUicontrolFontSize'), ...
  'Callback', @(s,e)obj.saveNote() ...
  );
set(obj.buttonLayout, 'Padding', 7);
set(obj.bodyLayout, 'Heights', [30,-1]);
set(obj.mainLayout, 'Heights', [-1,50], 'Spacing', 5);
end