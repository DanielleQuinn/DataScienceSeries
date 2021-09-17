
# Loop through each value of site and render an individual report for that site

library(rmarkdown)
for (site in c("A", "B", "C", "D", "E")) {
  render('parameterized_report.Rmd',
         params = list(site = site),
         output_file = paste0("report_site", site, ".html"))
}
