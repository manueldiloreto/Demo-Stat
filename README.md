<h1>1. Overview</h1>

Demo-Stat provides an alternative way to navigate Italian demographic statistics. The app draws data from the Italian National Institute of Statistics (ISTAT) and re-elaborates it into key indicators to monitor population shifts and aging. These indicators are available at the national, regional (NUTS-2), and municipal levels.

Currently, the following indicators are available:

- Growth Rate (%): The annual average rate of change of population size, expressed as the ratio between the annual increase in the population size and the total population for that year, multiplied by 100.
- Rate of Natural Increase (%): difference between the number of live births and the number of deaths among the resident population occurred both in Italy and abroad.
- Median Age: age that divides the population in two parts of equal size.
- Dependency Ratio (%): ratio between the population of inactive age (0-14 years and 65 years and over) and the population of active age (15-64 years), multiplied by 100.
- Old-age Dependency Ratio (%): ratio between the population aged 65 and over and the population aged 15-64, multiplied by 100.

New data will be added every year, following ISTAT's release patterns.
[https://j3nf0a-manuel-di0loreto.shinyapps.io/Demo-Stat/?_ga=2.250250447.810931187.1677490030-2092836390.1674216917)[Access Demo-Stat].


<h2>2. Making Demo-Stat</h2>

Demo-Stat was made with R Shiny. The application uses data that was downloaded from ISTAT and reworked into useful indicators. Each year, the application will be restarted and new data will be automatically added and displayed. On the UI side, Demo-Stat uses TablerDash with some modifications of mine combined with ShinyWidgets. On its most elementary level, Demo-Stat displays a series of cards contained in a series of fluidRows and Columns. Behind the scenes, Demo-Stat datasets react and are subsetted based on users' inputs. 

At the data cleaning stage, I used custom functions to streamline the process. These function can be observed (https://github.com/manueldiloreto/Demo-Stat/blob/main/cleanser.R)[here] and can be reused to clean any demographic dataset downloaded from ISTAT as a compact SDMX. 
