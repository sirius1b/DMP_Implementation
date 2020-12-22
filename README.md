# DMP_Implementation 
Course project of ECE670. 

-->> run: Record_Motion   
		(r : to generate waypoits, s: to save  them)
	Record the trajectory and save them
-->> run: Main_DMP
	give the input of file were it was saved earlier step

	Outputs: Force f(x) estimation plots
Figure 1 graph of force estimation wrt time
		plus spaneed version
{estimation for both X and Y}


	estimating f(s) first from DMP equation

	then usin that extract weights "wi"

MAin_DMP generated weigts and extracted weigts into a new file "name_weigts.xlsx
"

-->>Load the file "load_weights" : Load the DMP Parametes in the workspace

-->> next step go to simulik;
	
	DMP Block: Canonical System Generation i.e. x,v,v' Fig1 of the paper

[I did't get the scalig part exlanation : alpha and tau]
		

--> Then we output refrence state i.e. joinstate variables ;and design controller and system(repesetig dyamics)
		
 -->> use the maniulator.m file at last to generate worksace value
-->> Use the visualizer(Manipulator.m) file to see the visulation