function T = sizeWorkspace(S)
% SIZEWORKSPACE displays the variable in the current workspace and some
% infos about them
%
%   T = sizeWorkspace(whos)
%
% Must be called as sizeWorkspace(whos) (as of v1)
%
% see also WHOS
%
%  ------------------------------------------------
%  developed using Matlab Version 9.1.0 (R2016b)
%  v1 - September 2017
%  Paul Meyer-Rachner - paul@meyer-rachner.email
%  ------------------------------------------------



S = rmfield(S, {'global', 'persistent', 'nesting'});

T = struct2table(S);

% convert Bytes to MB
T.bytes = round(T.bytes/2^20, 2);

% change name
T.Properties.VariableNames{3} = 'megabytes';

% capitalize first letter because it is prettier
for k = 1:length(T.Properties.VariableNames)
    T.Properties.VariableNames{k}(1) = ...
        upper(T.Properties.VariableNames{k}(1));
end % for

% display table
disp(T)

end % function

