# ex_chart_via_grw
Charts via Genero Report Writer 

Example demonstrating how you can incorporate Charts/Graphs etc in your Genero applicaiton via Genero Report Writer.

The basics of the technique is that Genero Report Writer is used to create a chart from the data that is sent to it.  The output format selected is "Image", and then this image is displayed to an Image widget in your Genero application.

In the example, I have only done a small selection of the report options available.

The code is ...
```
LET filename = ex_chart_from_grw.generate(rec, arr)
```
...
to produce an image with a temporary file name which is then displayed to an IMAGE widget

The first argument is a record containing a list of report options.
The second argument is a dynamic array of keys and values.

You would extend by adding other arguments to the first parameter for different report options you wanted to control programatically.  You could also extend the second argument to add additional details about each item such as color.

The advantages of this method utilising Genero Report Writer is that it does not require the use of a 3rd party graph/chart web component, nor does it require you using fglsvgcanvas to produce something from scratch.  You also get consistency of appearance between your generated reports and what appears in your Genero application screens.

The disadvantages are that you are limited to the charting options that are available from within Genero Report Writer.
There is limited ability to make your charts interactive.
For performance reasons, you might wish to investigate the use of "distributed mode" within GRW so that the initialisation of the reporting libraries is not called for each individual chart.  Without using distributed mode you will probably find that each chart takes a second or three to be produced, using distributed mode this becomes near instantaneous.

When considering report options, you should compare this technique with using another Web Component provided by a 3rd party, and also by using the fglsvgcanvas Web Component to control all of the rendering.

The screenshots below show the 5 chart types that are available using a MapChart.

![Bar](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/d41194de-0353-4c18-bb13-d55f123cbc48)
![Bar 3D](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/5178d12e-98ea-4939-92b6-6cb6f9c949ea)
![Ring](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/f49bde29-836c-4cdd-ac1c-6d8e05b30560)
![Pie](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/edd3ae15-5095-4d56-bb62-1744e4f4870b)
![Pie 3D](https://github.com/FourjsGenero/ex_chart_via_grw/assets/13615993/b1d83ced-b4a5-417d-a11d-547a34b8783e)
