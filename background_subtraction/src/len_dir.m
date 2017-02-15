function [l] = len_dir(format)
    s = strcat('*.',format);
    d = dir(s);
    l = len(d);
    