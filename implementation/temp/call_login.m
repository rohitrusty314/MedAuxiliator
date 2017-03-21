
[login password] = logindlg('Title','Login Title');
     
     
     umsernamematch = strmatch('admin',login);
     passwordmatch  = strmatch('med',password);
     
     if(umsernamematch == 1)
         if(passwordmatch == 1)
             LoadQueryV3();
         end
    
     else
     msgbox('Invalid Username or Password','Error','Warn');
    
     end
