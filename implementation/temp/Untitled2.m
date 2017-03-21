% x = 0;
% h = waitbar(x,'message')
% waitbar(x,'message','CreateCancelBtn','button_callback')
% waitbar(x,'message')
% waitbar(x)
% waitbar(x,h)
% waitbar(x,h,'updated message')

message = 'please wait';
h = waitbar(0,'Please wait...');
steps = 1000;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h)