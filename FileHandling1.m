clear;
clc;
x=100*rand(8,1);
f1=fopen('1.bin','r');
fwrite(f1,x,'integer*8');
fclose(f1);
