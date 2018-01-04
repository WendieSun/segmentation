function [  ] = sizeOf( A )
%SIZEOF Summary of this function goes here
%   Detailed explanation goes here

fprintf('%s: %d x %d\n', inputname(1), size(A,1), size(A,2)); 
end

