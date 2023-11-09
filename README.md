# ex_chart_via_grw
Charts via Genero Report Writer 

Example demonstrating how you can incorporate Charts/Graphs etc in your Genero applicaiton via Genero Report Writer.

Thhe advantages of this method is that it does not require the use of a 3rd party graph/chart web component, nor does it require you using fglsvgcanvas to produce something from scratch.  

The disadvantages are that you are limited to the charting options that are availabel from within Genero Report Writer.
There is limited ability to make your charts interactive.
For performance reasons, you might wish to investigate the use of "distributed mode" within GRW so that the initialisation of the reporting libraries is not called for each individual chart.

The screenshots below show the 5 chart types that are available using a MapChart.

![Bar](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/d41194de-0353-4c18-bb13-d55f123cbc48)
![Bar 3D](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/5178d12e-98ea-4939-92b6-6cb6f9c949ea)
![Ring](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/f49bde29-836c-4cdd-ac1c-6d8e05b30560)
![Pie](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/edd3ae15-5095-4d56-bb62-1744e4f4870b)
![Pie 3D](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/b1d83ced-b4a5-417d-a11d-547a34b8783e)
