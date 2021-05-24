## Tidy Data  

The three most common problems with messy datasets:  
- Column headers are values, not variable names.
- Multiple variables are stored in one column.
- Variables are stored in both rows and columns.

Other common problems with messy datasets:  
- Using multiple tables  
- Using multiple tabs  
- Not filling in zeros  
- Using problematic null values  
- Using formatting to convey information  
- Using formatting to make the data sheet look pretty  
- Placing comments or units in cells  
- Entering more than one piece of information in a cell  
- Using problematic field names  
- Using special characters in data  
- Inclusion of metadata in data table  
- Date formatting  

*"Tidy datasets are all alike, but messy datasets are each messy in their own way." ~ Hadley Wickham*  

Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is  
messy or tidy depending on how rows, columns and tables are matched up with observations,  
variables and types. In tidy data:  
1. Each variable forms a column.  
2. Each observation forms a row.  
3. Each cell contains exactly one piece of information.  

There are a few potential errors to be on the lookout for in your own data as well as data from collaborators or the Internet. If you are aware of the errors and the possible negative effect on downstream data analysis and result interpretation, it might motivate yourself and your project members to try and avoid them. Making small changes to the way you format your data in spreadsheets can have a great impact on efficiency and reliability when it comes to data cleaning and analysis.  

Extracted and adapted from [Wickham, H. 2014. Tidy data. Journal of Statistical Software 59.](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html) and [Data Carpentry: Data Organization in Spreadsheets for Ecologists](https://datacarpentry.org/spreadsheet-ecology-lesson/)  

## Discussion  

### Spreadsheets  
How have you used spreadsheets in your research?  
What do you typically use a spreadsheet for?  
What do you think you should not use a spreadsheet for?  
Have you ever accidentally done something in a spreadsheet that made you frustrated?  

### Messy Data  
How does the data stored in `messy.xlsx` follow or break the rules of tidy data?  
What would you do better organize this data?  
Are there any aspects of your own data entry or data formatting that should be changed to meet tidy data requirements?  

### Reproducibility  
How do you keep track of your analysis?  
How do you organize your data and data files?  
