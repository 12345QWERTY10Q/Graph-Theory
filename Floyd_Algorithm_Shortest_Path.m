%%
% "Floyd Algorithm" Shortest Path
clc;
clear all;
%%
% Backgrond Information
Distance = [0,23,19,5,18,122;
            23,0,110,15,inf,inf;
            19,110,0,88,inf,4;
            5,15,88,0,6,inf;
            18,inf,inf,6,0,25;
            122,inf,4,inf,25,0];
start=1;
terminal=5;
%%
% Display Result
[Distance,Path,Min_Distance,Min_path]=floyd(Distance,start,terminal);
disp("Summary")
disp("Distance")
disp(Distance)
disp("Path")
disp(Path)
disp("Min Distance")
disp(Min_Distance)
disp("Min Distance Path")
disp(Min_path)
%%
% Function
%a，
%start:    Start Point
%terminal: Finish Point
%D(i,j):   Shortest Path between i and j
%path(i,j):After Point
%min1:     Shortest Distance between Start Point and Finish Point
%path1:    Shortest Path between Start Point and Finish Point
function [D,path,min1,path1]=floyd(a,start,terminal)



D=a;n=size(D,1);path=zeros(n,n);
%%
%size(A,1) 矩阵A的行数
%size(A,2) 矩阵A的列数
%[m,n]=size(A) ,m是矩阵A的行数，n是矩阵A的列数

%Initializes the path matrix
for i=1:n
    for j=1:n
        if D(i,j)~=inf
            path(i,j)=j;
        end  
    end
end

%Find out if there is a relay point to shorten the path
for k=1:n
    for i=1:n
        for j=1:n
            if D(i,k)+D(k,j)<D(i,j)
                D(i,j)=D(i,k)+D(k,j);
                path(i,j)=path(i,k);
            end 
        end
    end
end

%Check whether there are 3 output 
if nargin==3
    min1=D(start,terminal);
    m(1)=start;
    i=1;
    path1=[ ];   
    %Switch to the path and return to path1
    while   path(m(i),terminal)~=terminal
        k=i+1;                                
        m(k)=path(m(i),terminal);
        i=i+1;
    end
    m(i+1)=terminal;
    path1=m;
end   
end

