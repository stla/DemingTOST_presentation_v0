codechunk <- function(code, size="100%"){
  html <- '<pre><code class="r" style="font-size:SIZE">RCODE
</code></pre>'
  html <- sub("RCODE",code,html)
  html <- sub("SIZE",size,html)
  cat(html)
}
linebreak <- function(height="10pt"){
  html <- tags$hr(style="height:HEIGHT; visibility:hidden;")
  html <- sub("HEIGHT",height,html)
  as.character(html)
}
textbox <- function(text, borderstyle="solid", borderwidth="3px", bordercolor="seaShell", 
                    backgroundcolor="#FCDFFF", fontsize="25px"){
  html <- '<span style="border-style:BOSTYLE;border-width:BOWIDTH;border-color:BOCOLOR;background-color:BACOLOR;font-size:FSIZE">TEXT</span>'
  html <- sub("BOSTYLE",borderstyle,html)
  html <- sub("BOWIDTH",borderwidth,html)
  html <- sub("BOCOLOR",bordercolor,html)
  html <- sub("BACOLOR",backgroundcolor,html)
  html <- sub("FSIZE",fontsize,html)
  html <- sub("TEXT",text,html)
  as.character(html)
}
