clear;clc; clf;
td = 0.001;

% DMP_Parameters

 fName = input("Recorded Trajectory File:");
% fName = "Six.xlsx";
% [q,tn] = Link_Model_2(fName,td);

%---------------------------------------
timeScale = 5;
axisScale = 1;
[xn,yn,tn] = genTraj(fName,td,1,timeScale,axisScale);
q = [xn',yn'];
%---------------------------------
% figure;
subplot(2,1,1);
[wg_q1,cs_q1,hs_q1,n] = dmp(q(:,1)',td,tn);
DMP.wg_q1 = wg_q1;
DMP.cs_q1 = cs_q1';
DMP.hs_q1 = hs_q1';
% DMP.n_q1 = n;

subplot(2,1,2);
[wg_q2,cs_q2,hs_q2,n] = dmp(q(:,2)',td,tn);
DMP.wg_q2 = wg_q2;
DMP.cs_q2 = cs_q2';
DMP.hs_q2 = hs_q2';
% DMP.n_q2 = n;

% restructure program to save files in appropriate folder.
DMPT = struct2table(DMP);
fc = char(fName);
wg_File_Name  = strcat(fc(1:end-5),"_weights.xlsx");
writetable(DMPT,wg_File_Name);
% load_weights;
% wg_File_Name;





