function feat=extract_features(filename)
    O=readObj(filename);
    bx=max(O.v(:,1))-min(O.v(:,1));
    by=max(O.v(:,2))-min(O.v(:,2));
    bz=max(O.v(:,3))-min(O.v(:,3));
    d=norm([bx,by,bz]);
    feat=[bx,by,bz,d];
end

