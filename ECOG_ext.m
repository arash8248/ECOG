function INDEX = MAIN_ecog(TEXT)
% keyboard
INDEX = {};
temp = TEXT;
temp = regexprep(temp,'\s+',' ');

range = false;
startIndex = regexpi(temp,' ecog');
startIndex = [startIndex regexpi(temp,'ecog ')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+ecog')];
startIndex = [startIndex regexpi(temp,'ecog+[-/*?",!@#$%^&({<>:;\.\\]')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+ecog+[-/*?",!@#$%^&({<>:;\.\\]')];
if length(startIndex)>3
    if ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) ECOG 0')) || ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ])ECOG 0')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \))ECOG 0')) || ~isempty(regexpi(temp,'(?:,\(x\)|\( x\)|\(x \)) ECOG 0')) || ...
            ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) KPS 100% - Asymptomatic, fully active; Able to carry on all pre-disease performance without restriction / ECOG 0')) || ...
            ~isempty(regexpi(temp,'(?:X|X_) ECOG 0')) || ~isempty(regexpi(temp,'(?:X|X_)ECOG 0')) || ...
            ~isempty(regexpi(temp,'0 (?:\[x]|\[ x]|\[x ]) Fully active; able to carry on all predisease performance'))
        INDEX = 0;
        return;
    elseif ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) ECOG 1')) || ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ])ECOG 1')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \))ECOG 1')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \)) ECOG 1')) || ...
            ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) KPS 80-90% - Symptomatic, fully ambulatory, and restricted only in physically strenuous activity; Able to carry out work of a light or sedentary nature \(light house work, office work\) / ECOG 1')) || ...
            ~isempty(regexpi(temp,'(?:X|X_) ECOG 1')) ||  ~isempty(regexpi(temp,'(?:X|X_)ECOG 1')) || ...
            ~isempty(regexpi(temp,'1 (?:\[x]|\[ x]|\[x ]) Restricted in physically strenuous activity but ambulatory'))
        INDEX = 1;
        return;
         elseif ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) ECOG 2')) || ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ])ECOG 2')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \))ECOG 2')) || ~isempty(regexpi(temp,'((?:\(x\)|\( x\)|\(x \)) ECOG 2')) || ...
            ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) KPS 60-70% - Symptomatic, ambulatory, capable of self care, but unable to carry out any work activities; >50% of waking hours out of bed / ECOG 2')) || ...
            ~isempty(regexpi(temp,'(?:X|X_) ECOG 2')) || ~isempty(regexpi(temp,'(?:X|X_)ECOG 2')) || ...
            ~isempty(regexpi(temp,'2 (?:\[x]|\[ x]|\[x ]) Ambulatory and capable of all self-care but unable to'))
        INDEX = 2;
        return;
         elseif ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) ECOG 3')) || ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ])ECOG 3')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \))ECOG 3')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \)) ECOG 3')) || ...
             ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) KPS <60% - Symptomatic, limited self care; confined to bed or chair >50% of waking hours in bed. / ECOG 3')) || ...
            ~isempty(regexpi(temp,'(?:X|X_) ECOG 3')) ||  ~isempty(regexpi(temp,'(?:X|X_)ECOG 3')) || ...
            ~isempty(regexpi(temp,'3 (?:\[x]|\[ x]|\[x ]) Capable of only limited self-care; confined to bed or'))
        INDEX = 3;
        return;
         elseif ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ]) ECOG 4')) || ~isempty(regexpi(temp,'(?:\[x]|\[ x]|\[x ])ECOG 4')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \))ECOG 4')) || ~isempty(regexpi(temp,'(?:\(x\)|\( x\)|\(x \)) ECOG 4')) || ...
            ~isempty(regexpi(temp,'X(?:X|X_) ECOG 4')) ||  ~isempty(regexpi(temp,'(?:X|X_)ECOG 4')) || ...
            ~isempty(regexpi(temp,'4 (?:\[x]|\[ x]|\[x ]) Completely disabled; cannnot carry on any self-care'))
        INDEX = 4;
        return;
    end

end
startIndex = [startIndex regexpi(temp,' performance status')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+performance status')];
startIndex = [startIndex regexpi(temp,' PS ')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+PS ')];
startIndex = [startIndex regexpi(temp,' PS+[-/*?",!@#$%^&({<>:;\.\\]')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+PS+[-/*?",!@#$%^&({<>:;\.\\]')];
startIndex = [startIndex regexpi(temp,'[-/*?",!@#$%^&({<>:;\.\\]+PS+(\d)')];
startIndex = [startIndex regexpi(temp,' PS+(\d)')];

if isempty(startIndex)
    return;
end

for k = 1:length(startIndex)
    flag= false;
    for j = startIndex(k):startIndex(k)+75
        if j<=length(temp)
            if ~isempty(str2num(temp(j))) && isreal(str2num(temp(j)))
                tt = [temp(j)];
                if str2num(tt) < 5 && isempty(str2num(temp(j+1))) %&& (temp(j-1) ~= '>' && temp(j-1) ~= '<' && temp(j-2) ~= '>' && temp(j-2) ~= '<')% if the next one is not a number (more than 1 digit for a number is not acceptable) and is not < >

                    if temp(j+1) == '-' && ~isempty(str2num(temp(j+2)))% choose the second one (0-1)
                        range = true;
                        flag = true;
                        try
                            INDEX{k} = str2num(temp(j+2));
                        catch
                            INDEX{k} = str2num(tt);
                        end
                    elseif temp(j+1) == '-' && isempty(str2num(temp(j+2))) && ~temp(j+2) == ' '% choose 0 for (0--)
                        range = true;
                        flag = true;
                        INDEX{k} = str2num(tt);
                    elseif temp(j+2) == '-' && temp(j+3) ~= ' '% choose the second one (0 -1)
                        range = true;
                        flag = true;
                        try
                            if ~isepmty(str2num(temp(j+3)))
                                INDEX{k} = str2num(temp(j+3));
                            else
                                INDEX{k} = str2num(tt);
                            end
                        catch
                            INDEX{k} = str2num(tt);
                        end
                    elseif temp(j+2) == '-' && temp(j+3) == ' ' % choose the second one (0 - 1)
                        range = true;
                        flag = true;
                        try
                            if ~isepmty(str2num(temp(j+4)))
                                INDEX{k} = str2num(temp(j+4));
                            else
                                INDEX{k} = str2num(tt);
                            end
                        catch
                            INDEX{k} = str2num(tt);
                        end
                    elseif temp(j+1) == '-' && temp(j+2) == ' ' % choose the second one (0- 1)
                        range = true;
                        flag = true;
                        try
                            if ~isepmty(str2num(temp(j+3)))
                                INDEX{k} = str2num(temp(j+3));
                            else
                                INDEX{k} = str2num(tt);
                            end
                        catch
                            INDEX{k} = str2num(tt);
                        end
                    elseif temp(j+1) == '.' && ~isempty(str2num(temp(j+2))) % handle 2.5
                        flag = true;
                        INDEX{k} = round(str2num(temp(j:j+2)));
                    else
                        flag = true;
                        INDEX{k} = str2num(tt);
                    end
                    if INDEX{k} == 0
                        IND = j;
                    end
                end
                break;
            end
        end
    end

    if flag %Disregard explanations about ecog (0   Fully active, able to carry on all pre-disease performance without restriction     1   Restricted in physically strenuous activity but)
        if INDEX{k} == 0
            if IND+100 < length(temp)
                STR = temp(IND:IND+100); %slice from 0 to 100 next characters
            else
                STR = temp(IND:end); %slice from 0 to 100 next characters
            end
            stind = regexpi(STR,'1');
            if ~isempty(stind)
                if IND+15 < length(temp)
                    SLICE1 = temp(IND:IND+15);
                else
                    SLICE1 = temp(IND:end);
                end
                if stind(1)+20 < length(STR)
                    SLICE2 = STR(stind(1):stind(1)+20);
                else
                    SLICE2 = STR(stind(1):end);
                end
                if ~isempty(regexpi(SLICE1,'fully')) && ~isempty(regexpi(SLICE2,'Restricted'))
                    INDEX{k} = -2;
                end
            end
        end
    else
        INDEX{k} = -1;
    end
    if INDEX{k} == 0 && ~isempty(regexpi(temp,'ECOG Performance Status: \(ECOG/Karnofsky = 0/100%, 1/80-90%, 2/60-70%, 3/40-50%, 4/20-30%\)'))
        INDEX{k} = -1;
    end
end
for j = 1:length(INDEX)
    if INDEX{j} > 4
        INDEX{j} = -1;
    end
end
try
    INDEX = cell2mat(INDEX);
catch
end
INDEX = max(INDEX);
