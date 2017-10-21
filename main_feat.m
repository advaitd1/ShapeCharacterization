% All files must be one folder up from where the obj files are located
clear
% folder
Component={'Fuselage';'Horizontal Stabilizer';'Left Wing';'Right Wing';'Vertical Stabilizer'};
Feat=[];
for j=1:length(Component)
    B=dir(Component{j});
    Ob={};
    % read whatever is .obj in the folder
    for k=1:length(B)
        if logical(strfind(B(k).name,'obj'))
            Ob{k}=B(k).name;
        end
    end

    %remove empty elements from Ob
    Ob=Ob(~cellfun('isempty',Ob));


    % extract features
    
    for i=1:length(Ob)
        F=(mat2str(cell2mat(fullfile(pwd,Component{j},Ob(i)))));
        F=strrep(F,'''','');
        Feat(j,i,:)=extract_features(F);
    end
end

%if a body doesnt have a component, include a logic to understand that.
%get rid of folder substructure dependance

