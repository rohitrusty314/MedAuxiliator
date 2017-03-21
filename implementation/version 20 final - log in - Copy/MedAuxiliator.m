[login password] = logindlg('Title','Login Title');
umsernamematch = strmatch('admin',login);            %username entered is matched
passwordmatch  = strmatch('med',password);           %password entered is matched
if(umsernamematch == 1)
    if(passwordmatch == 1)
        LoadQueryV3();                  %if both username and password are correct proceed to accessing the system
    end
else
    msgbox('Invalid Username or Password','Error','Warn');      %else an error message
end
