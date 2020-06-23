# Calathea
An elegant theme for growth and flow.

---

<p float="middle">
<img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/icon.png" width="100" height="100" title="icon"> <img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/icon_highlight.png" width="100" height="100" title="icon_highlight"> <img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/icon_chunk.png" width="100" height="100" title="icon_chunk">
</p>

---

This theme is based on colors from the Calathea genus.  It features dark green backgrounds with lighter green, pink, and purple foregrounds.  The Calathea.csv shows the color scheme features, Hexo.js/Highlight.js code options, tmTheme with a rsTheme manual edit for R markdown documents, the color names, and finally the HEX code colors.  A few utilizations can be found in the utilizations folder, including a rstheme for RStudio and Hexo css for blogdown. The rstheme comes from the tmTheme with the manual edit from the Calathea.csv file.  The calathea_hexo.css file pulls from the Calathea.csv and created by create_css_files.R.

### Calathea Theme in RStudio

<img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/screenshot.PNG" title="screenshot">

### Calathea Theme Code Close-up

<img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/screenshot_code.PNG" title="screenshot">

### Calathea Theme RMarkdown Close-up

<img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/screenshot_markdown.PNG" title="screenshot">


The theme can be directly imported after downloading the [`.rstheme`](https://github.com/WilliamTylerBradley/Calathea/main/utilizations/Calathea.rstheme) file for RStudio &lt 2.1.

See [RStudio IDE Custom Theme Support](https://blog.rstudio.com/2018/10/29/rstudio-ide-custom-theme-support/) for a pictorial step-by-step, or [Creating Custom Themes for RStudio](https://rstudio.github.io/rstudio-extensions/rstudio-theme-creation.html#sharing-a-theme) if you want to learn more.

To download and apply the theme to RStudio, run the following code in RStudio:
```r
rstudioapi::addTheme("https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/utilizations/Calathea.rstheme", apply = TRUE)
```
(Shout out to [@batpigandme](https://github.com/batpigandme)'s [night-owlish theme](https://github.com/batpigandme/night-owlish) for information on this section.)
 

---

The foreground color have at least a 4.5:1 contrast with all the background colors.

| Feature           | Color  | Background Contrast | Selection Contrast | Chunk Contrast |
| :---              | :---   |                ---: |               ---: |           ---: |
| Code	            | White	 |               13.50 |              11.05 |          15.32 |
| Comment	          | Purple |	              5.66 |               4.63 |           6.42 |
| Keyword Contants	| Pink	 |               10.97 |               8.99 |          12.45 |
| Keyword Functions	| Green	 |                5.51 |               4.51 |           6.25 |
| Number	          | Dull	 |                8.81 |               7.22 |          10.00 |
| String	          | Yellow |	             11.81 |               9.67 |          13.40 |

The appearance for the color scheme under a few color blindness settings.


| Full Color | Deuteranopia | Monochromacy |
| :---:| :---: | :---: |
| <img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/color_test_raw.PNG" width="200" title="color_test_raw"> | <img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/color_test_deuteranopia.png" width="200" title="color_test_deuteranopia"> | <img src="https://raw.githubusercontent.com/WilliamTylerBradley/Calathea/main/images/color_test_monochromacy.png" width="200" title="color_test_monochromacy"> |


---

DOTO?
- [ ] Light Theme
- [ ] 7:1 Contrast