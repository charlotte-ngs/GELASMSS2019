### 
###
###
###   Purpose:   Generate Regression Dataset with Body Weight and Breast Circumference
###   started:   2019-02-26 (pvr)
###
### #################################################################################### ###

### # Store data from Essl1987 (chapter 9) in a tibble
tbl_reg <- tibble::tibble(Animal = c(1:10),
                          `Breast Circumference` = c(176, 177, 178, 179, 179, 180, 181, 182,183, 184),
                          `Body Weight` = c(471, 463, 481, 470, 496, 491, 518, 511, 510, 541))

### # save the data to a csv file
s_here <- here::here()
s_out_path <- file.path(liss_here, "ex/w03","bw_bc_reg.csv")
readr::write_csv(tbl_reg, path = s_out_path)


