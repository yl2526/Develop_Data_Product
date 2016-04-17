---
title       : IS YOUR FOOD SAFE?
subtitle    : Outcome of Domestic Food Facilities Inspections
author      : Yi Liu
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]  # mathjax, quiz, bootstrap
ext_widgets : {rCharts: libraries/nvd3} # {rCharts: ["libraries/highcharts",                                              # "libraries/nvd3", "libraries/morris"]}
mode        : selfcontained         # {standalone, draft}
knit        : slidify::knit2slides
---

# Introduction

## Some may think food safety is not a problem in US...  

### Over **300,000** Americans are hospitalized every year due to contaminated foods or beverages  
### **5,000** out of those end up with **_death_**  
  
  The Center for Food Safety and Applied Nutrition (CFSAN)
  is responsible for carrying out the inspections and specific tests        with only a little over 800 employees.
  
  This Shiny app will demostrate some results for the outcome of food
  safety inspection by CFSAN.

---
# Possible inspection outcomes: 
###    1. Official Action Indicated (**OAI**):  
        significant objectionable conditions are found and regulatory 
        action is warranted  
###    2. Voluntary Action Indicated (**VAI**):  
        objectionable conditions are found, but not at a level that 
        warrants regulatory action  
###    3. No Action Indicated (**NAI**):  
        no objectionable condition is found  

---
## Got interested?  

### example at next slide
[More at this Shiny App](https://chaorenliuyi.shinyapps.io/shiny)

### This is just a casual exploratory look for the food safety data
  
  
### Tons of places to look.  
  
[wiki page for __food safety risk analysis__](https://en.wikipedia.org/wiki/Food_safety_risk_analysis)  

[foodrisk.org](http://foodrisk.org/)  
# ...  
...

---
## Preliminary exploration 



<link rel='stylesheet' href=http://nvd3.org/assets/css/nv.d3.css>
<script type='text/javascript' src=http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js></script>
<script type='text/javascript' src=http://d3js.org/d3.v3.min.js></script>
<script type='text/javascript' src=http://timelyportfolio.github.io/rCharts_nvd3_tests/libraries/widgets/nvd3/js/nv.d3.min-new.js></script>
<script type='text/javascript' src=http://nvd3.org/assets/lib/fisheye.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 550px;
  }  
  </style>
<div id = 'chart1d5030d0661' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1d5030d0661()
    });
    function drawchart1d5030d0661(){  
      var opts = {
 "dom": "chart1d5030d0661",
"width":    800,
"height":    550,
"x": "District.Decision",
"y": "X",
"group": "urban",
"type": "multiBarChart",
"id": "chart1d5030d0661" 
},
        data = [
 {
 "urban": "Rural",
"District.Decision": "NAI",
"X": 9456 
},
{
 "urban": "urban",
"District.Decision": "NAI",
"X": 7911 
},
{
 "urban": "Rural",
"District.Decision": "OAI",
"X": 281 
},
{
 "urban": "urban",
"District.Decision": "OAI",
"X": 388 
},
{
 "urban": "Rural",
"District.Decision": "VAI",
"X": 4642 
},
{
 "urban": "urban",
"District.Decision": "VAI",
"X": 4671 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>




