## DMP_Implementation 
This project is about [demonstration learning](http://www.scholarpedia.org/article/Robot_learning_by_demonstration) technique, [DMP(Dynamic Movement Primitives)](https://homes.cs.washington.edu/~todorov/courses/amath579/reading/DynamicPrimitives.pdf) applied on 2DOF manipulators to generate to waypoints for manipulator's controller. DMP is a strategy to generate trajectory for controller to execute, generated trajectory would be based on data-points records recorded via kinestatic means or sensor deployed in immersive teleoperation scenario(s). 
Improvement of DMP over standard interpolation methods are the following:
- Ability to adjust for temporal scaling
- Ability to adjust for spatial scaling in accordance to the external point in tha Task-Space
- Asymptotic convergence of trajectory to the external point

It a provide a means to genearate extensive set of movements for robots without explicity code for the movement. It is based on the work of [Schaal et. al](https://homes.cs.washington.edu/~todorov/courses/amath579/reading/DynamicPrimitives.pdf) with foundation in neurobiology.

<hr>
This is an implementation of DMP over a scenario to recreate a user's hand writing on 2DOF manipulator using record way-points in task-space. Hand writing is recorded in task space represented in (XY) coordinate and it is decomposed in the weights for gaussian kernels(basis functions). In simulink, these weights are loaded to generate the trajectory for 2DOF manipulator. Animation generated using peter coorke's toolbox.

<!-- >> run: Record_Motion    -->
	run: Record_Motion
	(r : to generate waypoits, s: to save  them)
	Record the trajectory and save them

<img src="Images/1.png">

<!-- >> run: Main_DMP -->

	run: Main_DMP
	give the input of file were it was saved earlier step
<img src="Images/2.png">

	Outputs: Force f(x) estimation plots
<img src="Images/4.png">

	Figure 1 graph of force estimation wrt time plus spaneed version
	{estimation for both X and Y}
	estimating f(s) first from DMP equation	then usin that extract weights "wi"

Main_DMP generated weigts and extracted weigts into a new file "name_weigts.xlsx"

	Use the maniulator.m file at last to generate worksace value
	Load the file "load_weights" : Load the DMP Parametes in the workspace

<img src="Images/6.png">

	next step go to simulik;
	DMP Block: Canonical System Generation i.e. x,v,v' Fig1 of the paper
<img src="Images/7.png">

		

	Then we output refrence state i.e. joinstate variables; and design controller and system(repesetig dyamics)

	Use the visualizer(Manipulator.m) file to see the visulation

<img src="Images/11.png">

## Documents:
- [Literature Review](../main/DOCS/Literature_Review.pdf)
- [Project Report](../main/DOCS/Project_Report.pdf)