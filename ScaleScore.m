function s = ScaleScore(s,scale, maxS,minS)
    s = (s-minS)/(maxS-minS);
    s = 2*scale*s-scale;
end