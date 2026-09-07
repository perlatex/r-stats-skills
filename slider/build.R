rmarkdown::render("Upset.Rmd")

renderthis::to_pdf("Upset.html")
renderthis::to_pdf("Upset.html", partial_slides = TRUE, delay = 8)

pagedown::chrome_print("Upset.html", output = "Upset.pdf")
